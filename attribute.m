%%%%%%%%%%%%%%%%%%%%%���ӳ���
function y=attribute(X,n)
%����Ϊ��ȡ��ԭ���ݼ�X�еĵ�n����������Ӧ��һ��ֵ
[M,N]=size(X);
for i=1:M
    temp{i}=X{i}{n}; %��ָ����ֵ��temp��������
end
y=temp';%ת��
