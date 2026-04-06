import json
import os
import re
from collections import OrderedDict, defaultdict

import requests
from bs4 import BeautifulSoup
from flask import Flask, jsonify, request
from flask_cors import CORS

from claudeFunction import askToClaude
from openaiFunction import askTochatGPT


def html_to_text(html):
  # Create a BeautifulSoup object from the HTML
  soup = BeautifulSoup(html, 'html.parser')

  # Get the text content of the HTML
  plain_text = soup.get_text()

  # Remove extra whitespace and line breaks
  plain_text = ' '.join(plain_text.split())

  return plain_text


app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'


def get_custom_search_results(api_key, keywords_list, range="all"):
  base_url = 'https://www.googleapis.com/customsearch/v1'
  story_search_engine_id = 'c3e9929bcb5ef48ca'
  all_search_engine_id = '005674220268235399096:okh1g5elt3e'
  search_engine_id = all_search_engine_id

  if range == "pxdstory":
    search_engine_id = story_search_engine_id

  result_counts = defaultdict(lambda: {
      'count': 0,
      'title': '',
      'snippet': '',
      'score': 0
  })
  max_score = len(keywords_list) * 10

  try:
    for index, keywords in enumerate(keywords_list[0:3]):
      response = requests.get(base_url,
                              params={
                                  'key': api_key,
                                  'cx': search_engine_id,
                                  'q': keywords
                              })

      if response.status_code == 200:

        data = response.json()
        for rank, item in enumerate(data['items']):
          link = item['link']
          result_counts[link]['count'] += 1
          result_counts[link]['title'] = item['title']
          result_counts[link]['snippet'] = item['snippet']
          result_counts[link]['score'] += (max_score - (index * 10 + rank))

    sorted_results = sorted(result_counts.items(),
                            key=lambda x: x[1]['score'],
                            reverse=True)
    items = [{
        "link": url,
        "score": result['score'],
        "title": result['title'],
        "snippet": result['snippet']
    } for url, result in sorted_results]
    return {"keywords": keywords_list, "items": items}
  except:
    return {"keywords": keywords_list, "items": []}


def get_keywords_question(api_key, question):
  print(question)
  prompt = f"""You are a Search Assistant specialized in keyword optimization. Your task is to generate search keywords for the given question in order of importance:

1. First, provide 2-3 essential core keywords that capture the main concept
2. Then, add 3-4 more detailed search terms 

Rules:
- Order keywords from basic/general to specific/detailed
- Include common variations and related terms
- Keep keywords concise and search-friendly
- answer in Korean but you can use the language of the question.

Output format:
{{
  "keywords": [
    "퍼소나",
    "퍼소나 정의",
    "퍼소나 의미",
    ...
  ]
}}

  ### QUESTION: {question}"""

  ###QUESTION:{question}'''

  response = askToClaude(prompt)
  # print(response)
  data = json.loads(response)
  print(data)
  keywords_list = data['keywords']
  return keywords_list


@app.route('/', methods=['GET'])
def home():
  return ("hi")


@app.route('/search', methods=['GET'])
def search_api():
  api_key = os.environ['GCSEARCH_KEY']
  question = request.args.get('q')
  range = request.args.get('range')

  if not range:
    range = 'pxdstory'

  keywords = get_keywords_question(api_key, question)

  if keywords:
    results = get_custom_search_results(api_key, keywords, range)
    if results:
      results['question'] = question
      return jsonify(results)
    else:
      return jsonify({'error': 'No results found.'}), 404
  else:
    return jsonify({'error': 'Missing keywords parameter.'}), 400


@app.route('/ask', methods=['GET', 'POST'])
def ask_api():
  api_key = os.environ['GCSEARCH_KEY']
  question = request.args.get('q')
  stylePrompt = request.args.get('style')
  model = request.args.get('model', "claude-3-5-haiku-latest")

  if request.method == 'POST':
    params = request.get_json()
    question = params.get("q")
    stylePrompt = params.get('style')
    model = params.get('model', "claude-3-5-haiku-latest")

  keywords = get_keywords_question(api_key, question)
  if keywords:
    results = get_custom_search_results(api_key, keywords, "pxdstory")
    if results:

      items = results.get('items')
      # print(items)
      if not items:
        json = OrderedDict([('question', question),
                            ('answer',
                             "죄송합니다. 관련 정보를 찾을 수 없습니다. 키워드를 바꿔서 질문해 보세요."),
                            ('keywords', keywords), ('blogs', items[0:5])])
        return jsonify(json)

      pattern = r"/(\d+)"
      extracted_links = []
      result = []

      for item in items:
        link = item["link"]
        match = re.search(pattern, link)
        if match:
          extracted_link = match.group()
          extracted_links.append(extracted_link)
          result.append({"title": item["title"], link: link})

      # result = ",".join(extracted_links)

      print(result[0:3])

      simple_blog_data = []
      blog_data = get_blog_body(",".join(extracted_links[0:3]))
      if blog_data:
        blog_bodies = []

        for item in blog_data:
          html = item['body']
          plain_text = html_to_text(html)
          blog_bodies.append(f"""
          <file>
          <title>{item['title']}</title>
          <body>{plain_text}</body>
          <url>https://story.pxd.co.kr{item['url']}</url>
          </file>
          """)
          # simple_blog_data.append({
          #     'title': item['title'],
          #     'link': item['link']
          # })

        content = "\n".join(blog_bodies)
        prompt = f"""
        you are ui ux professional assistant.read the content and anser the question.
        <CONTENT>는 파일<file>별로 나뉘어져 있어.
        <CONTENT>{content} </CONTENT>
        <QUESTION>{question}</QUESTION>
        주어진 content 내용을 이용해 답 해주세요. 우선 간단히 정리하고, 그 다음 자세히 설명해줘. 예시를 들어 주면 좋아. 그리고 content에서 관련 내용 인용해서 보여줘. 인용한 경우 제목과 링크를 출처 링크로 추가해줘. 가급적 여러 글을 종합해서 답을 해줘. 더쿠 말투로 자세히 설명해줘. '더쿠'라는 언급은 제외해줘. markdown 형식으로 나타내줘.no yapping.
        """
        # model = "claude-3-5-sonnet-latest"
        # model = "claude-3-5-haiku-latest"
        # print(prompt)
        if "claude" in model:
          answer = askToClaude(prompt, model)
        else:
          answer, usage = askTochatGPT(prompt, model)

        print(model)
        print(answer[0:100])

        # prompt2=f"""
        # <CONTENT>{answer} </CONTENT>
        # 주어진 내용을 더쿠 말투로 자세히 설명해줘. '더쿠'라는 언급은 제외해줘. markdown 형식을 이용하고 링크는 꼭 유지해줘.
        # """
        if stylePrompt:
          prompt2 = f"""
          <CONTENT>{answer} </CONTENT>
          {stylePrompt}
          """
          print(stylePrompt)

          answer = askToClaude(prompt2, "claude-3-5-sonnet-latest")

        json = OrderedDict([('question', question), ('answer', answer),
                            ('keywords', keywords), ('blogs', items[0:5])])
        return jsonify(json)

      else:
        return jsonify({'error': 'No blog data found.'}), 404
    else:
      return jsonify({'error': 'No results found.'}), 404
  else:
    return jsonify({'error': 'Missing keywords parameter.'}), 400


def get_blog_body(urls):
  api_url = f"https://story-api.pxd.systems/article-metas?urls={urls}&body=1"
  response = requests.get(api_url)
  if response.status_code == 200:
    data = response.json()
    return data
  else:
    return None


if __name__ == '__main__':
  app.run(host='0.0.0.0', port=81)
