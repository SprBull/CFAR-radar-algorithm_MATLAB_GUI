function [ xc ] = env_edge(variance,  shape, power_db, show_out)
%UNIFORM_EN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if (nargin==3)
    show_out=0;
end

c=10.^(power_db./10);               % �����Ƿ��ȡ�������
xc=random('Normal',0,variance,1,shape(1,end)); 
xc(1,1:end)=xc(1,1:end)+c(1,1);
index=1;
for i=1:length(power_db)
    xc(1,index:shape(1,i))=xc(1,index:shape(1,i)).*c(1,i)./c(1,1);
    index=shape(1,i)+1;
end


if show_out==1
   plot(20.*log(abs(xc))./log(10));
end

end