%%%%%%%%%%%%%%%%%%%
function y=probality(E) %�����������ĸ���
[M,N]=size(E);
class=unique(E);%��þ������Ե����
[m,n]=size(class);
p=zeros(m,1);%�������p��ʼ��
for i=1:M
    for j=1:m
        if(isequal(E{i},class{j}))
            p(j)=p(j)+1; %�����������������ʣ�Ƶ����
        end
    end
end
y=(p+1.0)/(M+m);%�ø��������� 
