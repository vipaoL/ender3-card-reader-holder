screwD = 4.8;
screwHoles = [[10, 10], [30, 30]];
thickness = 3;
usbDims = [12.2, 4.7];
frameW = 40;
cutInFrameDims = [6.1, 6.1];
cutsInFrameCentersX = [9.5, 29.5];
gapBtwFaceAndCut = 1.5;

difference() {
    cube([frameW, frameW, thickness]);
    for (screwHole = screwHoles) {
        translate([screwHole[0], screwHole[1], 0]) cylinder(d = screwD, h = thickness);
    }
}

translate([frameW/2, 0, 0]) {
    difference() {
        resize([0, (usbDims[1]*2 + thickness) * 2, 0]) cylinder(d = frameW, h = frameW);
        translate([-frameW/2, 0, 0]) cube([frameW, frameW/2, frameW]);
        translate([0, -(usbDims[1]/2 + thickness), frameW/2])cube([usbDims[0], usbDims[1], frameW], center=true);
    }
}
length = frameW - thickness - gapBtwFaceAndCut;
for (cutInFrameX = cutsInFrameCentersX) {
    translate([cutInFrameX, cutInFrameDims[1]/2, thickness + gapBtwFaceAndCut]) {
        difference() {
            translate([0, 0, length/2])
            cube([cutInFrameDims[0], cutInFrameDims[1], length], center=true);
            // hardcoded. need to be set manually
            rotate([-45, 0, 0]) cube([cutInFrameDims[0], 5, 20], center=true);
        }
    }
}