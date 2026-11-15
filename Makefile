build: db run-auto
	echo "Done!"

run-auto:
	deno --allow-all auto/auto.ts

# TP1.md necesita un poco de intervencion manual para pulir el doc
tp1:
	cd output && pandoc TP1.md -o "../ACT3AV - TP1 - SANTIAGO_GARABAYA.pdf" --pdf-engine=xelatex -s --toc --include-before-body=caratula.tex

# TP2.md necesita un poco de intervencion manual para pulir el doc
prepare-tp2:
	deno -A auto/render.ts

tp2:
	cd output && pandoc TP2.md -o "../ACT3AV - TP2 - SANTIAGO_GARABAYA.pdf" --pdf-engine=xelatex -s --toc --include-before-body=caratula2.tex

db:
	docker compose up -d

clean:
	rm -rf output
