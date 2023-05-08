# Multilayer neutron optics based on isotope enriched 11B4C
This repository contains all raw LaTeX files and figures used to create my PhD dissertation. 
In the current state this is just a data dump of the raw folder, including all stress-induced chaos, but I intend to clean this up over time. Currently most figures are made such that they compile nicely when saving as .pdf_tex files. I will adept these to more usuable svg, as well as rasterized png versions so that it may be of benefit to others. 

The latest workable PDF of the thesis itself can be found as main.pdf, or on the right-hand side of the webpage under Releases.

## Compiling the thesis
This thesis is built in TeXStudio using TeXLive. Most of the development has been done on Fedora Silverblue using the Flatpak version of TeXStudio, which should include all neccesary packages. Bibliography management is done using Biber, this can all be compiled properly by executing Tools --> Commands --> Biber, followed by a complete compilation (Tools --> Commands --> LaTeX) a few times in TeXStudio. Most LaTeX distributions, including Overleaf should work fine but have not been tested.

The first two pages are created using a modified version of Linköping University's official LaTeX template, which can be found in it's original format [here](https://gitlab.liu.se/olale55/liuthesis). The modified version is included in this repository under the folder liuthesis-master, and is **not** covered by the CC-BY license in this work. On compile time, these pages as well as the cover art of this work are simply retrieved from the published PDF present in this repository under FULLTEXT01.pdf. The published version of this thesis is covered under the same CC-BY license, and can be found on [DiVA](https://urn.kb.se/resolve?urn=urn:nbn:se:liu:diva-193552).

## Opening and editing figures

The figures are all made in [Inkscape](https://inkscape.org/). To open and edit any of these, it is recommended to use Inkscape as well, which is Free and Open Source and available on all major operating systems. Currently, most figures are made such that they compile nicely with a consistent formatting when saved as .pdf_tex files in Inkscape, meaning any of the text in the figure source files are not suitable for most use cases. Proper editions for all figures in svg format, as well as rasterized png versions, will be added on a later date.

The vast majority of the graphs in this work are made using [Graphs](https://github.com/Sjoerd1993/Graphs) before being edited in Inkscape, Graphs can be downloaded on [Flathub](https://flathub.org/apps/se.sjoerd.Graphs) for most Linux distributions.

## Attribution

Note that this work is all licensed under a CC-BY license, meaning you are free to use, copy, share and edit any of the figures or texts in this work, but attribution is required. The easiest is to simply cite the PhD thesis itself, which depending on the citation format will be something like `Stendahl, S. (2023). Multilayer neutron optics based on isotope-enriched 11B4C. Linköping Studies in Science and Technology. Dissertations. https://doi.org/10.3384/9789180752305`. A BibTeX format can be retrieved from the linked website.

When using any of the figures, attribution may be omitted when explicit permission is granted by me per section 6c in the CC-BY license agreement. If this is required, send me an email at contact@sjoerd.se, and this may be arranged. 


## Missing articles

While the original thesis was created using a private git repository for version control, the original repository and its commit history has been deleted to avoid potential copyright issues with yet unpublished articles. It is for the same reason that the unpublished articles have been removed from this repository as well. These will be attached in the future if they're published under a compatible license, otherwise feel free to contact me to get a copy of said article at contact@sjoerd.se. Science should be shared and knowledge belongs to all of us, so I would be happy to provide such articles upon reasonable request.

 
