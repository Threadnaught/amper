kicad/lib/amper.pretty/%.kicad_mod: inkscape/footprints/%.svg inkscape/footprints/%.svg.py
	cp $< $<.broken
	inkscape --verb EditSelectAll --verb SelectionBreakApart --verb FileSave --verb FileQuit $<.broken
	svg2mod -i $<.broken -o $@
	rm $<.broken

	cp $@ $@.bak && cat $@.bak | ./$<.py > $@
	rm $@.bak