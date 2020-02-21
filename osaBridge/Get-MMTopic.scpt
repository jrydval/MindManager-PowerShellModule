JsOsaDAS1.001.00bplist00�Vscript_�args = $.NSProcessInfo.processInfo.arguments
argv = []
argc = args.count

for (var i = 0; i < argc; i++) {
    argv.push(ObjC.unwrap(args.objectAtIndex(i)))
}

mm = Application("MindJet MindManager")

if(mm.running()) { 

	if(mm.documents().length != 0) {
		doc = mm.documents[0]
		ctid = doc.centralTopic().id()
		topics = doc.topics

		out = ""


		for(i = 0; i < topics.length; ++i) {
			t = topics[i];

			if(t.id() != ctid) { parent = t.parent().id() } else { parent = "" }


			out = out + "\""+ i +"\",\""+ t.id() +"\",\""+ parent +"\",\""+ t.fillColor() +"\",\""+ t.textColor() +"\",\"" + encodeURI(t.name()) +"\"\n"
		}
	} else { "ERROR: Document is not opened" }

} else { "ERROR: MindManager is not running" }
                              � jscr  ��ޭ