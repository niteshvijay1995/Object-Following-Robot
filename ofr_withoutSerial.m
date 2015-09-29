%Team Robocon
%BITS Pilani

clear all;
clc;
warning off;

%Setting during time
time_duration = input('Time Duration : ');

if(length(time_duration)==0)    %Default value is 100
    time_duration = 100;
end

%Initialisation

%Initialising webcam
vid = videoinput('winvideo',1,'YUY2_160x120');
set(vid,'ReturnedColorSpace','rgb'); 
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',Inf);
triggerconfig(vid,'Manual');
start(vid);

%Capture
for i=1:time_duration
    %Caturing Image
    trigger(vid);
    I = getdata(vid,1,'uint8');
    k1 = I(:,:,1);  %Greyscale equivalent of Red
    k2 = I(:,:,2);  %Greyscale equivalent of Green
    k3 = I(:,:,3);  %Greyscale equivalent of Blue
    
    %Thresholding
    k = (k1-k2/2-k3/2); 
    a1 = k>65;
    
    %Correction
    a2 = bwareaopen(a1,10);
    se = strel('disk',4);
    a3 = imclose(a2,se);
    a4 = imfill(a3,'holes');
    
    %Centroid and Area Computation
    s = regionprops(a4,'Centroid','area');
    [m,n] = size(s);
    imshow(I);
    
    hold on;    %Retains plot in figure window
    if m~=0     %If No. of objects detected is not equal to zero  
            r = ceil(sqrt(s(1).Area/pi));   %ceil means least integer greater than or equal to r
            
            if r > 1    % radius cannot be less than 1 pixel
                
                plot(s(1).Centroid(1),s(1).Centroid(2),'r*');   %plotting Centroid
                DrawCircle(s(1).Centroid(1),s(1).Centroid(2),r,1000,'red'); %Drawing Circle
                
            if r <18    
                fprintf('Forward\n');   %Forward
            else if r>20
                   fprintf('Backward\n');   %Backward
                end
            end
                   if s(1).Centroid(1)>110
                        fprintf('Right\n');  %Right
                     else if s(1).Centroid(1)<70
                        fprintf('Left\n');  %Left
                         end
                   end
                    if s(1).Centroid(2)>100
                        fprintf('Backward\n');    %Backward
                    end
            end
    end
   hold off;    %Setting hold state to false

end

stop(vid);  %Stop video input object
