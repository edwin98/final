path='E:\ѧϰ����\����ͼ����\���ߴ���ҵ\��ҵ-ֱ�߼��\';
img{1}=imread(strcat(path,'test1.tif'));
img{2}=imread(strcat(path,'test2.png'));
img{3}=imread(strcat(path,'test3.jpg'));
img{4}=imread(strcat(path,'test4.bmp'));
img{5}=imread(strcat(path,'test5.png'));
img{6}=imread(strcat(path,'test6.jpg'));

for i=1:6
%     img{i}=rgb2gray(img{i});
    f=img{i}(:,:,1);
    img_line1{i}=edge(f,'sobel',0.05);
    img_line2{i}=edge(f,'canny');
    g1=img_line1{i};
    g2=img_line2{i};
    subplot(1,3,1)
    imshow(f)
    title('ԭͼƬ')
    subplot(1,3,2)
    imshow(g1)
    title('sobel')
    subplot(1,3,3)
    imshow(g2)
    title('canny')
    saveas(gcf,strcat(path,'test',num2str(i),'_��Ե���.jpg'));
end
    