#!/bin/bash

git clone https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
cd man-pages
git clone https://github.com/Yanpas/mandocset
 python3 mandocset/mandocset.py -o linux_man_pages -p ./ 



