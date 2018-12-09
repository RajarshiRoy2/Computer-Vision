%x='3';
%name='video-1543789164.mp4';
disp(x)
disp(name)
if x=='1'
    input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           F = 255 - image;%filter

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           imwrite(F,fullname); % Use this to get a video with edge detected frames
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          J = imcomplement(A);
          cd Video
          imwrite(J,name);
          cd ..
    end
    
%blurring filter
elseif x == '2'
input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           %filter
           F = imgaussfilt(image,10);

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           % Use this to get a video with edge detected frames
           imwrite(F,fullname);
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          J = imgaussfilt(A,10);
          cd Video
          imwrite(J,name);
          cd ..
    end

%superpixel filter
elseif x == '3'
input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           
           %filter
           [L, N] = superpixels(image, 300);
           F = zeros(size(image),'like',image);
           index = label2idx(L);
           row = size(image,1);
           col = size(image,2);
           for labelVal = 1:N
               red = index{labelVal};
               green = index{labelVal}+row*col;
               blue = index{labelVal}+2*row*col;
               F(red) = mean(image(red));
               F(green) = mean(image(green));
               F(blue) = mean(image(blue));
           end

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           % Use this to get a video with edge detected frames
           imwrite(F,fullname);
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          %filter
          [L, N] = superpixels(image, 300);
          F = zeros(size(image),'like',image);
          index = label2idx(L);
          row = size(image,1);
          col = size(image,2);
          for labelVal = 1:N
              red = index{labelVal};
              green = index{labelVal}+row*col;
              blue = index{labelVal}+2*row*col;
              F(red) = mean(image(red));
              F(green) = mean(image(green));
              F(blue) = mean(image(blue));
          end
          cd Video
          imwrite(J,name);
          cd ..
    end
elseif x == '4'
input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           %filter
           gray = rgb2gray(image);
           F = edge(gray,'canny');

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           % Use this to get a video with edge detected frames
           imwrite(F,fullname);
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);

          %Get edges
          gray = rgb2gray(A);
          F = edge(gray,'canny');
          
          cd Video
          imwrite(J,name);
          cd ..
    end

%Cartoon filter
elseif x == '5'
input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           %filter
           %increase contrast
           A = imadjust(image,[],[],0.5);
           %bilateral filter
           bilateral = imbilatfilt(A);
           %Get edges
           gray = rgb2gray(A);
           edges = edge(gray,'canny');
           %cartoonize
           for i=1:size(edges,1)
                for j=1:size(edges,2)
                    if(edges(i,j)==1)      
                        bilateral(i,j,:)=0;
                    end
                end
            end
            F = bilateral;

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           % Use this to get a video with edge detected frames
           imwrite(F,fullname);
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          %increase contrast
          A = imadjust(A,[],[],0.5);
          %bilateral filter
          bilateral = imbilatfilt(A);
          %Get edges
          gray = rgb2gray(A);
          edges = edge(gray,'canny');
          %cartoonize
          for i=1:size(edges,1)
               for j=1:size(edges,2)
                   if(edges(i,j)==1)      
                       bilateral(i,j,:)=0;
                   end
               end
          end
          F = bilateral;
          cd Video
          imwrite(F,name);
          cd ..
    end
elseif x == '6'
 input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           F = imadjust(image,[0.00 0.00 0.00; 1.00 0.38 0.40],[1.00 0.00 0.70; 0.20 1.00 0.40], [4.90 4.00 1.70]);

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           imwrite(F,fullname); % Use this to get a video with edge detected frames
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          J = imadjust(A,[0.00 0.00 0.00; 1.00 0.38 0.40],[1.00 0.00 0.70; 0.20 1.00 0.40], [4.90 4.00 1.70]);
          cd Video
          imwrite(J,name);
          cd ..
    end
   elseif x == '7'
 input = name;%'video.mp4';
    try 
        % Loading video
        v = VideoReader(input);
        % Creating directory to store images after processing
        currentDir = 'Video';
        mkdir(currentDir);
        mkdir(currentDir, 'Frames');

        % Extracting frames from the video
        % Extracting frames from input files and storing into a directory
        count = 1;
        while hasFrame(v)
           image = readFrame(v);  
           F = imadjust(image,[0.13 0.00 0.30; 0.75 1.00 1.00],[0.00 1.00 0.50; 1.00 0.00 0.27], [5.90 0.80 4.10]);

           % Store frame into directory
           file = [sprintf('frame%03d',count) '.jpg'];
           fullname = fullfile(currentDir,'Frames',file);
           imwrite(F,fullname); % Use this to get a video with edge detected frames
           count = count + 1;
        end

        % Finding image file names
        imageNames = dir(fullfile(currentDir,'Frames','*.jpg'));
        imageNames = {imageNames.name}';

        % Creating new video with images in the directory

        outputVideo = VideoWriter(fullfile(currentDir, name));
        outputVideo.FrameRate = v.FrameRate;
        open(outputVideo);
        
        for i = 1:length(imageNames)
           img = imread(fullfile(currentDir,'Frames',imageNames{i}));
           writeVideo(outputVideo,img);
        end

        %name2 = name+'.avi'
        s = strcat(name,'.avi');
        %disp(name2)
        close(outputVideo);
        cd Video
        %delete(name)
        movefile(s,name);
        cd ..
    catch
        %warning('input is an image');
        
          A = imread(name);
          J = imadjust(A,[0.13 0.00 0.30; 0.75 1.00 1.00],[0.00 1.00 0.50; 1.00 0.00 0.27], [5.90 0.80 4.10]);
          cd Video
          imwrite(J,name);
          cd ..
    end
end


