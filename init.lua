long_name = "Reformat Item Description"
short_name = "reformat-item-description" -- Determines the name of your addon's file.
for_module = "tome"
version = {1,7,6}
addon_version = {1,0,0}
weight = 9999 -- The lower this value, the sooner your addon will load compared to other addons.
author = {'Cornelius Matejka', 'cornelius.matejka@cmtjk.de'}
homepage = "https://github.com/cmtjk/tome-reformat-item-description"
description = [[
''Contributions, bug reports, and improvements are welcome at https://github.com/cmtjk/tome-reformat-item-description.''

This plugin reformats the item description text to align the keys of "key: value" lines, making it easier to read.
The original description code is not altered like other similar addons, so compatibility is very high.

Hold the ''Alt'' key and hover over an item to see the original, unformatted description.

'''Note:'''
This plugin increases the default tooltip width by 50%.
Properties with keys longer than 25 characters are not reformatted, to prevent excessive wrapping.
<pre>
...
  Type: tool / misc ; tier 5
  
  When wielded/worn:
             Damage (Melee): 25 physical bleed
    Damage when hit (Melee): 25 physical bleed
        Changes resistances: +15% temporal
             Changes damage: +10% temporal
                             +5% physical
                 Spellpower: +10 (+10 eff.)
                  Mindpower: +10 (+9 eff.)
  Activating this item is instant.
  It can be used to activate talent Animate Blade (costing 15 power out of 25/25) :
     Effective talent level: 5.0
                 Power cost: 15 out of 25/25.
                      Range: 10
               Travel Speed: instantaneous
                         Is: a spell
                Description: Open a hole in space, summoning an animated blade for 15 turns.
...
</pre>
]] -- A description of your addon.
tags = {'apewithgrape', 'reformat', 'item', 'items', 'description', 'improve', 'improvement', 'usability', 'tooltip', 'tooltips'} -- tags MUST immediately follow description
overload = false
superload = true
data = false
hooks = true
