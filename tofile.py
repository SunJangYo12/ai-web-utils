import json
import os

conditionals = None

with open("conversations.json", "rb") as f:
   conditionals = json.load(f)


count = 1

for jsonData in conditionals:
   title = jsonData['title']
   dest = f"data/{count}. {title}" #title belum difilter, error jika ada karakter unik
   os.mkdir(dest)

   with open(f"{dest}/data.json", 'wb') as f:
      f.write(bytes(f"{jsonData}\n", encoding='utf-8'))

   print(f"[+] process: {count} done.")
   count += 1
#   break

