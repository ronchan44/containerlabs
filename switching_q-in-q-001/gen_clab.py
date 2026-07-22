#!/usr/bin/python3

import configparser
from jinja2 import Environment, FileSystemLoader

# Load .ini config
config = configparser.ConfigParser(allow_no_value=True, delimiters=('=',))
config.optionxform = str  # preserve case
config.read("config.ini")

# Convert to dict
config_dict = {section: dict(config[section]) for section in config.sections()}

# Extract nodes
nodes = {s.split('.',1)[1]: config_dict[s] for s in config_dict if s.startswith("nodes.")}
config_dict["nodes"] = nodes

# Extract links (auto-number)
links_raw = list(config.items("links"))
links = {}
for idx, (key, value) in enumerate(links_raw, start=1):
    # If no key (bare line), configparser puts key as the whole string
    link_str = key if not value else f"{key} {value}"
    links[f"link{idx}"] = link_str

config_dict["links"] = links

# Render Jinja2 template
env = Environment(loader=FileSystemLoader("."))
template = env.get_template("template.j2")
output = template.render(config=config_dict)

# Save YAML
with open("ros.clab.yml", "w") as f:
    f.write(output)

