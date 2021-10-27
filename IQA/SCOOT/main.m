refpath = "/Users/fangnan/Downloads/实验图片/测试GT/";
dispath = "/Users/fangnan/Downloads/实验图片/Pix2Pix/";

ref_ext = ".jpg";
dis_ext = ".png";

img_list = dir(strcat(ref_path, "*"+ref_ext));
img_num = length(img_list);

sum=0;
for j=1:img_num
    ref_name=img_list(j).name;
    dis_name = ref_name(1:end-strlength(ref_ext)) + dis_ext;
    sketch=imread(strcat(ref_path,ref_name));
    synthesis=imread(strcat(dis_path,dis_name));
    Q = ScootMeasure(sketch,synthesis);
    sum=sum+Q;
    % fprintf('%d\n',Q);
end

fprintf('total num: %s\n', num2str(img_num));
fprintf('sum: %s\n',num2str(sum));
fprintf('mean: %s\n', num2str(sum/img_num));