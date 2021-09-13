function [ xc ] = env_uniform(variance,  shape, power_db, show_out)
%UNIFORM_EN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if (nargin==3)
    show_out=0;
end

c=10^(power_db/10);     % �����Ƿ��ȡ�������
xc=c + random('Normal',0,variance,1,shape); 
if show_out==1
plot(10.*log(abs(xc))./log(10));
end

end