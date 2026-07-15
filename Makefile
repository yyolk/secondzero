# Icon generation from SVG (using ImageMagick)
ICON_SVG = icon.svg
FAVICON_SVG = favicon.svg

.PHONY: all icons favicons clean

all: icons favicons

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

# Favicon sizes (small + common sizes)
# favicons: favicon-16.png favicon-32.png favicon-48.png favicon-64.png favicon-180.png favicon-192.png
favicons: favicon-32.png

# Disable all favicon generations except 32x32 for now, since most browsers support SVG favicons and we want to keep the repo small.
# favicon-16.png: $(FAVICON_SVG)
# 	convert -density 300 $< -resize 16x16 -background none $@

favicon-32.png: $(FAVICON_SVG)
	convert -density 300 $< -resize 32x32 -background none $@

# favicon-48.png: $(FAVICON_SVG)
# 	convert -density 300 $< -resize 48x48 -background none $@

# favicon-64.png: $(FAVICON_SVG)
# 	convert -density 300 $< -resize 64x64 -background none $@

# favicon-180.png: $(FAVICON_SVG)
# 	convert -density 300 $< -resize 180x180 -background none $@

# favicon-192.png: $(FAVICON_SVG)
# 	convert -density 300 $< -resize 192x192 -background none $@

# Clean generated PNGs
clean:
	rm -f icon-*.png favicon-*.png

# Optional: transparent + maskable versions (uncomment if needed)
# icon-512-transparent.png: $(ICON_SVG)
# 	convert -density 300 $< -resize 512x512 icon-512-transparent.png
