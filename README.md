Forked from the [Zalando Tech Radar](https://github.com/zalando/tech-radar)

Requirements:

- Access to the Tech Radar Googlesheets
- Pandoc (`brew install pandoc`)
- R (`brew install r`)
- R-packages getopt, rmarkdown, googlesheets4 (`R -e 'install.packages(c("getopt","rmarkdown","googlesheets4"),dependencies=TRUE, repos = "https://mirror.lyrahosting.com/CRAN/")'`

Usage:

```bash
cd docs
./radar.sh --solution=<solution> --
```

Solution being one of 'Fullstack', 'Integatie', 'Liferay', or 'Drupal'.

Landing page: https://finalist.github.io/tech-radar/

## License

```
The MIT License (MIT)

Copyright (c) 2017 Zalando SE

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
