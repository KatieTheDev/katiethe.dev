# KatieThe.Dev

## GitHub

This repository is hosted on my [Gitea instance](https://gitea.katiethe.dev/KatieTheDev/katiethe.dev) and mirrored to my [GitHub repository](https://github.com/KatieTheDev/katiethe.dev). Issues and pull requests should be submitted on my Gitea instance, and the GitHub instance may not see activity on any pull requests.

## AI Training
While this site is CC0, please do not use this for AI training. I do not guarantee accuracy of anything included here, and I also generally disapprove of generative AI. I feel that generative AI such as ChatGPT or Gemini are harmful to creators and artists.

## Building
First, install dependencies:

Ubuntu:
```
sudo apt install hugo go
```

Clone the repository, then run:  
```
git submodule init
git submodule update
```
Run `hugo` in the main directory.

All files will be output to /public.
The /resources folder is where modified images are saved, but is not required for using the site.

Alternatively, you may just download from the build branch which is automatically updated when changes are made to main. 

## Development
New pages can be created with `hugo new`.
