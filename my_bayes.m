%@author:zhangkai
%@date:2016-12-28
function [out]=my_bayes(X,Y)
% XΪԭ���ݼ�,Y��ҪԤ������ݣ�out�Ƿ���Ԥ��Ľ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ѵ������
[M,N]=size(X);
[m,n]=size(X{1});
decision=attribute(X,n); %��ȡ��������
Pro=probality(decision);%����������Ը���������
for i=1:n-1
    [post_pro{i},post_name{i}]=post_prob(attribute(X,i),decision); %����������Ժ������
end

%%%%%%%%%%%%%%%%%%%%%%%%Ԥ�ⲿ��
uniq_decis=unique(decision); %��������Ե����
P_X=ones(size(uniq_decis,1),1); %��ʼ���������Ժ������
[M,N]=size(Y);
k=1;
for i=1:M
    for j=1:n-1
        [~,loc]=ismember(attribute({Y{i}},j),unique(attribute(X,j)));%�������Լ���������
        if(loc>0)
        P_X=post_pro{j}(:,loc).*P_X;%���������Ժ������֮������Ҷ˹��ʽ��
        end
    end
     P_X=P_X.*Pro;
   
%      ��������ѧϰ%Ctf:predicting t actually is f;  Cft>=Ctf.
        Ctf=1;Cft=6;Ctt=0;Cff=0;
     if(Pro(1)<Pro(2))
         LT=P_X(2)*Ctf+P_X(1)*Ctt;
         LF=P_X(1)*Cft+P_X(2)*Cff;
         if(LT>LF)
             I=2;
         else
             I=1;
         end
     else
         LT=P_X(1)*Ctf+P_X(1)*Ctt;
         LF=P_X(2)*Cft+P_X(2)*Cff;
         if(LT>LF)
             I=1;
         else
             I=2;
         end
     end
%     [MAX,I]=max(P_X);%Ѱ�����ֵ
    out{k}=uniq_decis{I};%��һ��������Ժ����������������������һ��
    k=k+1;
    P_X=ones(size(uniq_decis,1),1);%�ٴγ�ʼ���������Ժ������P_X���Ա�Ϊ��һ����������׼��
end
 %��������ת����ʽ��
out=out';