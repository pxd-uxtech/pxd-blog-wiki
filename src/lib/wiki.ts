import fs from 'node:fs';
import path from 'node:path';

export interface ConceptPage {
  slug: string;
  name: string;
  sources: string[];
  updated: string;
  content: string;
}

const CONCEPTS_DIR = path.join(process.cwd(), 'wiki/concepts');

function parseFrontmatter(raw: string): { frontmatter: Record<string, any>; body: string } {
  const match = raw.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/);
  if (!match) return { frontmatter: {}, body: raw };

  const fm: Record<string, any> = {};
  for (const line of match[1].split('\n')) {
    const idx = line.indexOf(':');
    if (idx === -1) continue;
    const key = line.slice(0, idx).trim();
    let val = line.slice(idx + 1).trim();
    if (val.startsWith('[')) {
      try { val = JSON.parse(val); } catch { /* keep as string */ }
    }
    if (typeof val === 'string' && val.startsWith('"') && val.endsWith('"')) {
      val = val.slice(1, -1);
    }
    fm[key] = val;
  }
  return { frontmatter: fm, body: match[2] };
}

function wikiLinksToHtml(body: string, allSlugs: Set<string>): string {
  return body.replace(/\[\[([^\]]+)\]\]/g, (_, name) => {
    const slug = name.replace(/[\s/\\:]/g, '-').replace(/-+/g, '-');
    if (allSlugs.has(slug)) {
      return `<a href="/concepts/${slug}">${name}</a>`;
    }
    return `<span class="missing-link">${name}</span>`;
  });
}

export function getConceptPages(): ConceptPage[] {
  if (!fs.existsSync(CONCEPTS_DIR)) return [];

  const files = fs.readdirSync(CONCEPTS_DIR).filter(f => f.endsWith('.md'));
  const pages: ConceptPage[] = [];

  for (const file of files) {
    const raw = fs.readFileSync(path.join(CONCEPTS_DIR, file), 'utf-8');
    const { frontmatter, body } = parseFrontmatter(raw);
    pages.push({
      slug: file.replace('.md', ''),
      name: frontmatter.name || file.replace('.md', '').replace(/-/g, ' '),
      sources: Array.isArray(frontmatter.sources) ? frontmatter.sources : [],
      updated: frontmatter.updated || '',
      content: body,
    });
  }

  return pages.sort((a, b) => a.name.localeCompare(b.name, 'ko'));
}

export function renderConceptContent(content: string, allSlugs: Set<string>): string {
  let html = wikiLinksToHtml(content, allSlugs);

  html = html
    .replace(/^### (.+)$/gm, '<h3>$1</h3>')
    .replace(/^## (.+)$/gm, '<h2>$1</h2>')
    .replace(/^# (.+)$/gm, '<h1>$1</h1>')
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\[([^\]]*(?:\[[^\]]*\][^\]]*)*)\]\((https?:\/\/[^)]+)\)/g, '<a href="$2" target="_blank" rel="noopener">$1</a>')
    .replace(/^- (.+)$/gm, '<li>$1</li>')
    .replace(/(<li>.*<\/li>\n?)+/g, (m) => `<ul>${m}</ul>`)
    .replace(/\n\n/g, '</p><p>')
    .replace(/^(?!<[hul])/gm, (line) => line ? `<p>${line}` : '')
    ;

  return html;
}
