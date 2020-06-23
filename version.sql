- hosts: dbserver
  become: yes
  tasks:
    - name: copy the database to the development server
      copy:
        src=/etc/ansible/mysql/git/ansible-mysql-schema/accounts.sql    
        dest=/tmp

    - name: import the database
      mysql_db:
        name: accounts
        login_user: root
        login_password: Jersey@123
        state: import
        target: /tmp/accounts.sql
