   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WpfApp1WpfApp1  5   	       WpfApp1.AdminShifts   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:WpfApp1     5   	     � Title$  AdminShifts��5   	   $	��450��6   $	��800��6*    � 
ResizeMode$ NoResize=�5	   	    � WindowStartupLocation$ CenterScreen=�5
   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $
��Auto �6   .+�5   
   �  � Orientation$ 
Horizontal=�6   $��0��6-   .+�5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ ForTestAboba��5      $��0 0 5 0q�62   $)��#Поиск пользователя��6C   6_   �� 5      -   5         ��Name$ SearchTextBox��5   &   $	��170��6   6=   5      �� 5      -   5        $��	400 0 5 0q�5      $��
Назад��6(   68   5      �� 5   
   -   5         ��Name$ AdminShiftsListView��5   %   $��0 20 0 0q�6   $��1��6B   	 �� View	 5      �� 5      .P�5      �� $��Дата��6%   
 �� DisplayMemberBinding
 63   �� *data+�� 5      $��Имя��6%   
 62   �� *	User.name+5      5      � 5    
   $��2��6    � ColumnDefinitions 5!      �� 5"      $��* �6#   �� 5#      $��* �6#   .+�5%      �� -   5        $��Удалить��5%      $��0��6'   $��50��67   $	��150��6C   6h   �� 5&      -   5        $��Добавить��5&      $��1��6(   $��50��68   $	��150��6D   6g   5'      5(      5)      