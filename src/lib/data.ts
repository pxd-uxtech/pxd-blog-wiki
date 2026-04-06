import rawData from '../../raw/all_metas.json';

export interface Article {
  url: string;
  title: string;
  tags: string[];
  date: number;
  author: string;
  category: string;
  thumbnail: string;
}

// 날짜순 정렬 (최신 먼저)
export const articles: Article[] = (rawData as Article[])
  .filter(a => a.title && a.url)
  .sort((a, b) => b.date - a.date);

export function formatDate(timestamp: number): string {
  const d = new Date(timestamp);
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

export function getYear(timestamp: number): number {
  return new Date(timestamp).getFullYear();
}

export function getMonth(timestamp: number): number {
  return new Date(timestamp).getMonth() + 1;
}

export function articleUrl(url: string): string {
  const id = url.replace('/', '');
  return `https://story.pxd.co.kr/${id}`;
}

export function toSlug(name: string): string {
  return name.replace(/[\s/\\:]/g, '-').replace(/-+/g, '-');
}

// 집계 함수들
export function getCategoryMap(): Map<string, Article[]> {
  const map = new Map<string, Article[]>();
  for (const a of articles) {
    const cat = a.category || '미분류';
    if (!map.has(cat)) map.set(cat, []);
    map.get(cat)!.push(a);
  }
  return map;
}

export function getAuthorMap(): Map<string, Article[]> {
  const map = new Map<string, Article[]>();
  for (const a of articles) {
    const author = a.author || '알 수 없음';
    if (!map.has(author)) map.set(author, []);
    map.get(author)!.push(a);
  }
  return map;
}

export function getTagMap(): Map<string, Article[]> {
  const map = new Map<string, Article[]>();
  for (const a of articles) {
    for (const tag of a.tags || []) {
      if (!map.has(tag)) map.set(tag, []);
      map.get(tag)!.push(a);
    }
  }
  return map;
}

export function getYearMap(): Map<number, Article[]> {
  const map = new Map<number, Article[]>();
  for (const a of articles) {
    const y = getYear(a.date);
    if (!map.has(y)) map.set(y, []);
    map.get(y)!.push(a);
  }
  return new Map([...map.entries()].sort((a, b) => b[0] - a[0]));
}

export function getTopTags(n: number): [string, Article[]][] {
  const tagMap = getTagMap();
  return [...tagMap.entries()]
    .sort((a, b) => b[1].length - a[1].length)
    .slice(0, n);
}
