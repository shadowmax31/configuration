config.set("url.searchengines", {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "y": "https://www.youtube.com/results?search_query={}",
    "r": "https://www.reddit.com/search?q={}"
});

config.set("editor.command", ["vim", "-f", "{file}", "-c", "normal {line}G{column0}l"]);

config.bind('z', 'hint links spawn mpv {hint-url}');
