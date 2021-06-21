% function [fc]=feature_study()
for i=1:3
    nam=num2str(i);
    ext='.txt';
    path='\\gts-pc\EMB 15-16\MATLAB 18-19\DELIVERABLES_2018_2019\Module_3\CARDIAB\db\';
    file_name=strcat(path,nam,ext)
fid1 = fopen(file_name,'r');
s=fread(fid1,[1,3000],'int8')'
NumSamp=1000;
figure;
subplot(2,2,1)
p=plot(s);
title('ECG Input Signal for Patient 1')

% Sampling frequency
N=length(s);
i=1:NumSamp;
subplot(2,2,2)
stem(s(i))
title('Sampled Signal')
for kkkg=1:3
waveletFunction = 'db8';
                [C,L] = wavedec(s(i),8,waveletFunction);
                cD6 = detcoef(C,L,6);
                cD7 = detcoef(C,L,7); 
                subplot(2,2,3)

                Beta = cD6;
                plot(1:1:length(Beta), Beta,'-*r'); 
                title('One Cycles of PQRST-ECG Data - DWT Filter Level I');

                Alpha = cD7; %D7;
                subplot(2,2,4)
                plot(1:1:length(Alpha),Alpha,'-*k'); 
                title('One Cycles of PQRST-ECG Data - DWT Filter Level II');
pause(1)                
[c,l] = wavedec(s,3,'db1'); 
wname='db1';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wname);

subplot(221); stem(Lo_D); 
title('Decomposition low-pass filter'); 
subplot(222); stem(Hi_D); 
title('Decomposition high-pass filter'); 
subplot(223); stem(Lo_R); 
title('Reconstruction low-pass filter'); 
subplot(224); stem(Hi_R); 
title('Reconstruction high-pass filter'); 
xlabel('The four filters for db5')
% close all;
s=c*0.025;

end
fc(i)=sum(sum(s))
end



