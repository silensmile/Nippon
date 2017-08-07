clear;

filepath = 'E:\’’∆¨\20170807\';
filelist = dir(strcat(filepath,'*.JPG'));
filenum = length(filelist);
location = [];
for i = 1:filenum
    tempstruct = imfinfo(strcat(filepath,filelist(i).name));
    if isfield(tempstruct,'GPSInfo')
        tempGPS = tempstruct.GPSInfo;
        tempLat = tempGPS.GPSLatitude;
        tempLon = tempGPS.GPSLongitude;
        location = [location;tempLat(1)+tempLat(2)/60+tempLat(3)/3600,tempLon(1)+tempLon(2)/60+tempLon(3)/3600];
    end
end


load coastlines;
map = worldmap([30 46],[126 147]);
plotm(coastlat,coastlon);
locationnum = length(location);
for i = 1:locationnum
    geoshow(location(i,1),location(i,2),'DisplayType', 'Point','marker','.');
end

