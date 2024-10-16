+++
title = "Robots.txt"
date = "2024-10-16T12:40:57-06:00"
lastmod = "2024-10-16T12:40:57-06:00"
author = "KatieTheDev"
#cover = ""
#tags = ["", ""]
#keywords = ["", ""]
description = "A brief description of my robots.txt file as well as what kind of robots are allowed to interact with my page."
showFullContent = false
readingTime = true
hideComments = false
draft = false
+++
An updated copy of my robots.txt can be found below:
{{< snippet "/static/robots.txt" >}}

While all of my content (except for logos and images) is licensed under the Unlicense, I prefer that generative AI does not train on my website. Therefore, I have attempted to block such crawlers from my website.

This can be accomplished with:
```
User-agent: GPTBot
Disallow: /
User-agent: ChatGPT-User
Disallow: /
```

The following section can be used to block Google's generative AI:
```
User-agent: Google-Extended
Disallow: /
```

Commoncrawl (CCBot) is a non-profit crawler, but their data is commonly used for AI training:
```
User-agent: CCBot
Disallow: /
```

Perplexity AI can be blocked:
```
User-agent: PerplexityBot
Disallow: /
```

Claude is blocked with:
```
User-agent: anthropic-ai
Disallow: /
‍User-agent: Claude-Web
Disallow: /
User-agent: ClaudeBot
Disallow: /
```