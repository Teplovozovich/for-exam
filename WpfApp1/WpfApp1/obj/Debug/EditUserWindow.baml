   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.EditUserWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	     � Title$  EditUserWindow��5   	   $	��450��6    $	��800��6-    � 
ResizeMode$ NoResize=�5	   	    � WindowStartupLocation$ CenterScreen=�5
   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��167* �6   �� 5      $
��633* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ TextBoxEditName��5      $��имя��6-   $��0��68   6G   �� 5   
   $��0��6(   $��1��65   ��6   �� *name+6G   �� 5   
   $��статус��6   $��1��6"   61   �� 5   
   -   5         ��Name$ ComboBoxEditStatus��5   3   $��1��6O   $��1��6\    �� SelectedItem 6   �� *status+6�   �� 5   
   $��роль��6   $��2��6    6/   �� 5   
   -   5        $ ComboBoxEditRole��5      $��2��6-   $��1��6:   6L   �� 5    
   -   5        $��1��5       $��Сохранить��6!   $
��Left=�65   $��
129,27,0,0q�6P   $��4��6d   $	��Top=�6q   $��50��6�   $	��228��6�   6�   �� 5!   
   -   5        $��
Назад��5!      $��Center=�6!   $��0,27,0,0q�6>   $��4��6P   $	��Top=�6]   $��50��6u   $	��147��6�   6�   5"      5#      