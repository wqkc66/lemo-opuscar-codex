#!/usr/bin/env python3
"""Fetch one Lemo-Opuscar STYLE.md by slug into this skill's local cache."""
import argparse
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parents[1]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--style", required=True, help="Style slug from references/style-index.md")
    args = parser.parse_args()
    slug = args.style.strip().lower()
    if not slug or any(c not in "abcdefghijklmnopqrstuvwxyz0123456789-" for c in slug):
        parser.error("style must be a slug containing lowercase letters, digits, or hyphens")
    url = f"https://raw.githubusercontent.com/lemomo-ai/lemo-opuscar/main/styles/{slug}/STYLE.md"
    request = Request(url, headers={"User-Agent": "lemo-opuscar-codex-skill/1.0"})
    try:
        with urlopen(request, timeout=20) as response:
            content = response.read()
    except (HTTPError, URLError, TimeoutError) as exc:
        raise SystemExit(f"Could not fetch {slug} from the public upstream repository: {exc}")
    if not content.startswith(b"#") or b"404: Not Found" in content[:200]:
        raise SystemExit(f"No STYLE.md found for slug: {slug}")
    destination = ROOT / "references" / "styles" / slug / "STYLE.md"
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes(content)
    print(destination)

if __name__ == "__main__":
    main()
