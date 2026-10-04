build: db auto
	echo "Done!"

auto:
	deno --allow-all auto.ts

# TP.md necesita un poco de intervencion manual para pulir el doc
docs:
	cd output && pandoc TP.md -o ../TP.pdf --pdf-engine=xelatex -s --toc --include-before-body=caratula.tex

db:
	docker compose up -d

clean:
	rm -rf output
