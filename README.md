# KatieThe.Dev

## AI Training
While this site is Apache 2.0, please do not use this for AI training. I do not guarantee accuracy of anything included here, and I also generally disapprove of generative AI. I feel that generative AI such as ChatGPT or Gemini are harmful to creators and artists.

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
