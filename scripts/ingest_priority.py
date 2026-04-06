#!/usr/bin/env python3
"""조회수 기준 ingest 대상 추출. wiki/concepts/에서 이미 처리된 URL은 제외."""

import json
import glob
import re
import sys

def get_ingested_urls():
    """wiki/concepts/*.md에서 sources 배열의 URL들을 수집."""
    ingested = set()
    for path in glob.glob("wiki/concepts/*.md"):
        with open(path, encoding="utf-8") as f:
            content = f.read()
        match = re.search(r'sources:\s*\[([^\]]*)\]', content)
        if match:
            urls = re.findall(r'"(/\d+)"', match.group(1))
            ingested.update(urls)
    return ingested


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 10

    with open("raw/cluster_data.json", encoding="utf-8") as f:
        cluster = json.load(f)

    with open("raw/all_metas.json", encoding="utf-8") as f:
        metas = json.load(f)

    # title → meta 매핑
    title_to_meta = {}
    for m in metas:
        if m.get("title"):
            title_to_meta[m["title"].strip()] = m

    ingested = get_ingested_urls()

    # 조회수 순 정렬
    cells = sorted(cluster["data"]["cellData"], key=lambda x: -x["size"])

    candidates = []
    for cell in cells:
        title = cell["text"].strip()
        meta = title_to_meta.get(title)
        if not meta:
            continue
        if meta["url"] in ingested:
            continue
        candidates.append({
            "url": meta["url"],
            "title": title,
            "views": cell["size"],
            "author": meta.get("author", ""),
            "category": meta.get("category", ""),
        })
        if len(candidates) >= n:
            break

    print(f"=== Ingest 대상 상위 {n}개 (미처리) ===\n")
    urls = []
    for i, c in enumerate(candidates, 1):
        print(f"{i}. [{c['views']:,}뷰] {c['title']}")
        print(f"   URL: {c['url']} | 저자: {c['author']} | 카테고리: {c['category']}")
        urls.append(c["url"])

    print(f"\n--- API 호출 URL ---")
    url_param = ",".join(urls)
    print(f"https://story-api.pxd.systems/article-metas?urls={url_param}&body=1")


if __name__ == "__main__":
    main()
