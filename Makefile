# Icon generation from SVG (using ImageMagick)
ICON_SVG = icon.svg

.PHONY: all icons clean

all: icons

# Main icon sizes for PWA/app icons
icons: icon-128.png icon-512.png icon-1024.png

icon-128.png: $(ICON_SVG)
	convert -density 300 $< -resize 128x128 -background none $@

icon-512.png: $(ICON_SVG)
	convert -density 300 $< -resize 512x512 -background none $@

icon-1024.png: $(ICON_SVG)
	convert -density 300 $< -resize 1024x1024 -background none $@

# Optional extra sizes (uncomment if you want them)
# icon-192.png: $(ICON_SVG)
# 	convert -density 300 $< -resize 192x192 -background none $@
#
# icon-384.png: $(ICON_SVG)
# 	convert -density 300 $< -resize 384x384 -background none $@

# Clean generated PNGs
clean:
	rm -f icon-*.png

# Optional: transparent + maskable versions (uncomment if needed)
# icon-512-transparent.png: $(ICON_SVG)
# 	convert -density 300 $< -resize 512x512 icon-512-transparent.png
