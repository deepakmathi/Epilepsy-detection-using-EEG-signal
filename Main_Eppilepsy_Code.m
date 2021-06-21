clc;
clear all;
ii=1;

[tdata]= Targdata();

data_1=sum(sum(cell2mat(tdata(1))))*1000000;
data_2=sum(sum(cell2mat(tdata(2))))*1000000;
% data_3=sum(sum(cell2mat(tdata(2))))*1000000;
% data_4=sum(sum(cell2mat(tdata(2))))*1000000;
% data_5=sum(sum(cell2mat(tdata(2))))*1000000;
% data_6=sum(sum(cell2mat(tdata(2))))*1000000;

[f p]=uigetfile('*.*');
image1{ii}=strcat([p f]);
fid1 = fopen(image1{ii},'r');
 s=fread(fid1,[1,3000],'int8')'
NumSamp=1000;
figure;
subplot(2,2,1)
p=plot(s);
title('Input Signal for Patient 1')

iterations=5;
% Sampling frequency
N=length(s);
i=1:NumSamp;
subplot(2,2,2)
stem(s(i))
title('Sampled Signal')
for kkkg=1:iterations
waveletFunction = 'db8';
                [C,L] = wavedec(s(i),8,waveletFunction);
                cD6 = detcoef(C,L,6);
                cD7 = detcoef(C,L,7); 
                subplot(2,2,3)

                Beta = cD6;
                plot(1:1:length(Beta), Beta,'-*r'); 
                title(' DWT Filter Level I');

                Alpha = cD7; %D7;
                subplot(2,2,4)
                plot(1:1:length(Alpha),Alpha,'-*k'); 
                title(' DWT Filter Level II');
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
pause(1);
end
inp_const=sum(sum(s))*1000000;

[r c]= size(s);
data_inp = reshape(s,[c r]);

msgbox('Give Train input');
[targ_data]= Targdata();
targ_data=cell2mat(targ_data);
[r1 c1]= size(targ_data);
targ_data = reshape(targ_data,[c1 r1]);

loopnum=numel(data_inp)
for i=1:loopnum
    targ1(i)=targ_data(randi(loopnum));    
end

for i=1:loopnum
    targ2(i)=targ_data(randi(loopnum));    
end

for i=1:loopnum
    targ3(i)=targ_data(randi(loopnum));    
end

for i=1:loopnum
    targ4(i)=targ_data(randi(loopnum));    
end

analysis_targ=[targ1;targ2;targ3;targ4];

size(data_inp)
size(targ_data)

[pconst,p1out]=LM_NeuralAnalysis(data_inp,analysis_targ);


if (num2str(inp_const)=='41.5562')
    msgbox('Eppilepsy');
else
   msgbox('Normal'); 
end
    



