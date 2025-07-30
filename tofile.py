
import json
import os


conditionals = None
outhtml = None

with open("conversations.json", "rb") as f:
   conditionals = json.load(f)

with open("index.html", "r") as f:
   outhtml = f.read()


count = 1

for jsonData in conditionals:
   xtitle = jsonData["title"].split("/")
   title = xtitle[0]
   dest = f"data/{count}. {title}" #title belum difilter, error jika ada karakter unik
   os.mkdir(dest)

   jdata = json.dumps(jsonData)

   with open(f"{dest}/jsondata.js", "w") as f:
      f.write(f"var outjson = [{jdata}]")

   with open(f"{dest}/index.html", "w") as f:
      f.write(outhtml)

   print(f"[+] process: {count} done.")
   count += 1

#   break











