package datacollection;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Date;
 
public class test02
{
    public static void main ( String[] args ) throws Exception
    {
    	
    	
    	System.out.println("NL-XS-009-18070216".substring(6));
    	
    	System.out.print(new Date());
       /* // ������λ����ʾ��ǰ������ǵڼ�������
        // 0��ʾҪ�����һ����1��ʾҪ����ڶ���
        int where = 0;
        int i1 = 0;
        int i2 = 0;
        String str = null;
        BufferedReader buf = new BufferedReader (new InputStreamReader (System.in));
        // ����һ����ѭ��������������break�ı��߼���������
        while (true)
        {
            try
            {
                // �����һ������
                if (where == 0)
                {
                    System.out.println ("�����һ�����֣�");
                    str = buf.readLine ();
                    i1 = Integer.parseInt (str);
                    where = 1;
                }
                // ����ڶ�������
                if (where == 1)
                {
                    System.out.println ("����ڶ������֣�");
                    str = buf.readLine ();
                    i2 = Integer.parseInt (str);
                }
                System.out.println ("�������֮�͵��ڣ�" + ( i1 + i2 ));
                // �رն�����
                buf.close ();
                // ����ѭ��
                break;
            }
            // �����ַ���ת����ʱ�����ָ�ʽ���쳣
            catch (NumberFormatException e)
            {
                System.out.println ("�������ݲ����������������������� !");
                // ����쳣������������ǰѭ�������ؼ���
                continue;
                
            }
        }*/
    }
}
