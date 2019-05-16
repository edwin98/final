path='E:\学习资料\数字图像处理\第七次作业\作业-直线检测\';
img{1}=imread(strcat(path,'test1.tif'));
img{2}=imread(strcat(path,'test2.png'));
img{3}=imread(strcat(path,'test3.jpg'));
img{4}=imread(strcat(path,'test4.bmp'));
img{5}=imread(strcat(path,'test5.png'));
img{6}=imread(strcat(path,'test6.jpg'));

for i=1:6
%     img{i}=rgb2gray(img{i});
    f=img{i}(:,:,1);
    g=edge(f,'canny');

    [H,T,R]=hough(g,'RhoResolution',0.5,'Theta',-90:5:89);
    q=houghpeaks(H,8);
    x=T(q(:,2));
    y=R(q(:,1));
    plot(x,y,'s')
    lines=houghlines(g,T,R,q,'FillGap',20,'MinLength',40);
    
    subplot(1,3,1)
    imshow(f)
    title('原图片')
    subplot(1,3,2)
    imshow(g)
    title('sobel边缘检测')
    subplot(1,3,3)
    imshow(f)
    hold on
    for k=1:length(lines)
        xy=[lines(k).point1;lines(k).point2];
        plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
%         plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','yellow');
%         plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');
    end
    title('hough fillcap=60 minlength=40')
    saveas(gcf,strcat(path,'test',num2str(i),'_直线检测_60_40.jpg'));
end
    