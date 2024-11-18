# KatieThe.Dev

## Copyright

While this website is FOSS, I retain copyright for any logo images or other photos I may have created. Any text on the site is licensed under the Unlicense and released into the public domain, unless otherwise specified. 

Please check the [LICENSE.md](https://github.com/KatieTheDev/katiethe.dev/blob/main/LICENSE.md) file or the [License FAQ](https://github.com/KatieTheDev/katiethe.dev/blob/main/FAQ.md) for more information.

### AI Training
That said, please do not use this for AI training. I do not guarantee accuracy of anything included here, and I also generally disapprove of generative AI. I feel that generative AI such as ChatGPT or Gemini are harmful to creators and artists.

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

## Development
New pages can be created with `hugo new`.
