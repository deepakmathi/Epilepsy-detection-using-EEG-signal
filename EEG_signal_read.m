

clc;
clear all;
ii=1;
% Select input EEG Data from INPUT FOLDER
choice = questdlg('Select input EEG data Samples');
switch choice
case 'Yes'        
            [f p]=uigetfile('*.*');
            image1{ii}=strcat([p f]);
            fid1 = fopen(image1{ii},'r');
            s=fread(fid1,[1,3000],'int8')'
NumSamp=1000;
figure(3);
p=plot(s);
title('EEG Input Signal for Patient 1')

% Sampling frequency
N=length(s);
i=1:NumSamp;
figure(4);
stem(s(i))
title('Sampled Signal')

waveletFunction = 'db8';
                [C,L] = wavedec(s(i),8,waveletFunction);
                cD6 = detcoef(C,L,6); %BETA
                cD7 = detcoef(C,L,7); %ALPHA
                 figure(2);

                Beta = cD6;
                plot(1:1:length(Beta), Beta); 
                title('BETA');

                Alpha = cD7; %D7;
                figure(1);
                plot(1:1:length(Alpha),Alpha); 
                title('ALPHA'); 


case 'No'
    msgbox('Process Not initiated');
    
    case 'Cancel'
        msgbox('Try another Sample');
            
end    

    
    



