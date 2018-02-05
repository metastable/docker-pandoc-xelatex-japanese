# docker-pandoc-xelatex-japanese


---
docker run -t -i -v `pwd`:/data metastable/pandoc-xelatex-japanese:1.0 pandoc sample.md -s -o sample.html
docker run -t -i -v `pwd`:/data metastable/pandoc-xelatex-japanese:1.0 pandoc -V documentclass=bxjsarticle -V classoption=pandoc,ja=standard --latex-engine=xelatex sample.md -o sample.pdf
---