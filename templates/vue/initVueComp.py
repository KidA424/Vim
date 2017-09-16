import sys
import os

path = sys.argv[1]
templatePath = r'C:\Users\mknopf\vimfiles\templates'

if os.path.exists(path):
    raise Exception("Path already exists")

name = os.path.split(path)[1]
os.makedirs(path)

for file in ['index.vue', '{name}.js', '{name}.pug', '_{name}.scss']:
    with open("{templatePath}\\vue\\{file}".format(templatePath = templatePath, file = file.format(name = 'template')), 'r') as f:
        text = f.read()
    if file == 'index.vue':
        text = text.format(name = name)
    with open("{path}\\{file}".format(path = path, file = file.format(name = name)), 'w') as f:
        f.write(text)
    print("Created file {path}\\{file}".format(path = path, file = file.format(name = name)))
