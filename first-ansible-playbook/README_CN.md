# 第一个 Ansible Playbook 演示虚拟机

这个项目旋创建一个虚拟机，并演示了一个非常简单的 Ansible Playbook。

## 快速入门指南

### 1 - 安装依赖关系（VirtualBox, Vagrant, Ansible）。

  1. 下载并安装【VirtualBox】(https://www.virtualbox.org/wiki/Downloads)。
  2. 下载并安装 [Vagrant](http://www.vagrantup.com/downloads.html)。
  3. [仅限 Mac/Linux]安装[Ansible](http://docs.ansible.com/intro_installation.html)。

Windows用户注意。*本指南假设您使用的是Mac或Linux主机。目前不支持Windows主机。*

### 2 - 构建虚拟机

  1. 下载这个项目，并把它放在你想放的地方。
  2. 打开终端，cd 到这个目录。
  4. 4.输入`vagrant up`，让Vagrant发挥它的魔力。

注意： *如果在运行`vagrant up`的过程中出现任何错误，并且它让你回到命令提示符，只需运行`vagrant provision`继续从你离开的地方构建虚拟机。如果这样做了几次之后仍然有错误，请在GitHub上的项目问题队列中发布一个问题，并注明错误。*

### 代码说明

```yml
---
- hosts: all  # 执行所有目标 host
  become: yes # 提升管理员权限

  tasks:
  - name: Ensure chrony (for time synchronization) is installed.
    yum: # 软件包管理
      name: chrony
      state: present #存在

  - name: Ensure chrony is running.
    service: # 系统服务管理
      name: chronyd
      state: started #启动服务
      enabled: yes  # 开机启动

# The same as the above play, but in super-compact form!
# 这是超级简洁的无废话编写模式，功能和上一样
- hosts: all
  become: yes
  tasks:
  - yum: name=chrony state=present
  - service: name=chronyd state=started enabled=yes
```


## 注意

  - 要关闭虚拟机，在终端中输入 "vagrant halt"，在同一个文件夹中输入 "Vagrantfile"。要完全销毁它（如果你想节省一点磁盘空间，或者想用 "vagrant up "从头开始重建），输入 "vagrant destroy"。

## 关于作者

这个项目是由[Jeff Geerling](https://www.jeffgeerling.com/)创建的，作为[Ansible for DevOps](https://www.ansiblefordevops.com/)的一个例子。
