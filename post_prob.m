%%%%%%%%%%%%%%%%%
function [post_pro,post_name]=post_prob(E,D)
%EΪĿ�����ԣ�DΪ�������ԣ�post_pro����Ŀ�����Զ�Ӧ�ھ������Եĺ������
%post_nameΪ����ĺ�����ʱ�������
[M,N]=size(D);
decision=unique(D);%������������
attri=unique(E); %������������
[m1,n1]=size(decision);
[m2,n2]=size(attri);
temp=cat(2,E,D); %�����������Ժ;�������
post_pro=zeros(m1,m2); %������ʳ�ʼ��
for i=1:M
    for j=1:m2
        for k=1:m1
            post_name{k,j}=cat(2,{attri{j}},{decision{k}});
   if(isequal(temp(i,:),post_name{k,j}))
                post_pro(k,j)=post_pro(k,j)+1; %�������Ժ�����ʣ�Ƶ����
            end
        end
    end
end
for i=1:m1
    post_pro(i,:)=(post_pro(i,:)+1.0)/(sum(post_pro(i,:))+m2);%����������Ժ������
end
