%% �����ʼ��
clc;clear all;close all;

% %% ���ȱ�����������Ŀ��&��Ŀ�꣩
% shape=[200];
% variance=200;
% noise_db=20;
% noise_p=10.^(noise_db./10);
% show_out=1;
% [ xc ] = env_uniform(variance,  shape, noise_db,show_out);
% 
% %��Ŀ��
% SNR1=15;    signal1_p=10.^(SNR1./10).*noise_p
% des=90;
% xc(1,des)=signal1_p;

% %��Ŀ��
% SNR1=20;signal1_p=10.^(SNR1./10).*noise_p;
% xc(1,90)=signal1_p;
% SNR2=15;signal2_p=10.^(SNR2./10).*noise_p;
% xc(1,102)=signal2_p;


% �Ӳ���Ե������������Ŀ��&��Ŀ�꣩
shape=[100,200];
variance=200;
noise_db=[20,30];
noise_p=10.^(noise_db./10);
show_out=1;
[ xc ] = env_edge(variance,  shape, noise_db,show_out);

% ��Ŀ��
SNR1=15;signal1_p=10.^(SNR1./10).*noise_p(1,end);
SNR2=12;signal2_p=10.^(SNR2./10).*noise_p(1,end);
SNR3=8;signal3_p=10.^(SNR3./10).*noise_p(1,end);
SNR4=5;signal4_p=10.^(SNR4./10).*noise_p(1,end);
% 
loc1=randi([43,44],1,1);
xc(1,loc1)=signal1_p;
loc2=randi([46,48],1,1);
xc(1,loc2)=signal3_p;
loc3=randi([50,53],1,1);
xc(1,loc3)=signal2_p;
loc4=randi([55,58],1,1);
xc(1,loc4)=signal1_p;
loc5=randi([90,93],1,1);    %�ӽ��Ӳ�����������Ȼ��
%     xc(1,loc5)=signal1_p;
xc(1,loc5)=signal2_p;     %�����Ӳ���Ե��Ŀ������������Ҫ�Ż�
%     xc(1,loc5)=signal3_p;

loc6=randi([102,108],1,1);
xc(1,loc6)=signal3_p;

%% �㷨���&ͼ����ʾ
N=36;
pro_N=10;
PAD=10^(-4);
[ index, XT ] = cfar_ac( xc, N, pro_N, PAD);
figure;
plot(10.*log(abs(xc))./log(10)),hold on;
plot(index,10.*log(abs(XT))./log(10)),hold on;
% 
% [ index, XT ] = cfar_go( xc, N, pro_N, PAD);
% figure;
% plot(10.*log(abs(xc))./log(10)),hold on;
% plot(index,10.*log(abs(XT))./log(10)),hold on;
% 
% N=36;
% pro_N=2;
% k=2.*N./4;
% PAD=10^(-4);
% [ index, XT ] = cfar_os( abs(xc), N, k, pro_N, PAD);
% figure;
% plot(10.*log(abs(xc))./log(10)),hold on;
% plot(index,10.*log(abs(XT))./log(10)),hold on;
% 
% [ index, XT ] = cfar_so( xc, N, pro_N, PAD);
% figure;
% plot(10.*log(abs(xc))./log(10)),hold on;
% plot(index,10.*log(abs(XT))./log(10)),hold on;
