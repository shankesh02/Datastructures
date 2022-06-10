#include<iostream>
#include<stdlib.h>
#include<conio.h>
using namespace std;

struct node
{
    int data;
    struct node *lchild, *rchild;
};

class Binary_Tree
{
        struct node *root=NULL, *ptr=NULL;
    public:
        void create_node(int);
        void insert(int);
        void search(int);
        node *return_root();
        int getcount(struct node *);
        void display_inorder(struct node *);
        void display_preorder(struct node *);
        void display_postorder(struct node *);
};

void Binary_Tree::create_node(int a)
{
    struct node *n=new node;
    n->data=a;
    n->lchild=NULL;
    n->rchild=NULL;
    root=n;
}

void Binary_Tree::insert(int a)
{
    struct node *par=NULL;
    ptr=root;
    while(ptr!=NULL)
    {
        if(ptr->data<a)
        {
            par=ptr;
            ptr=ptr->rchild;
        }
        else
        {
            par=ptr;
            ptr=ptr->lchild;
        }
    }
    if(par->data<a)
    {
        struct node *n=new node;
        n->data=a;
        n->lchild=NULL;
        n->rchild=NULL;
        par->rchild=n;
    }
    else
    {
        struct node *n=new node;
        n->data=a;
        n->lchild=NULL;
        n->rchild=NULL;
        par->lchild=n;
    }
}

void Binary_Tree::search(int a)
{
    ptr=root;
    while(ptr!=NULL)
    {
        if(ptr->data==a)
        {
            cout<<"Element Found!"<<endl;
            break;
        }
        else if(ptr->data<a)
        {
            ptr=ptr->rchild;
        }
        else
        {
            ptr=ptr->lchild;
        }
    }
    if(ptr==NULL)
    {
        cout<<"Search Unsuccessful!"<<endl;
    }
}

node *Binary_Tree::return_root()
{
    return root;
}

int Binary_Tree::getcount(struct node *T)
{
    if(T==NULL)
        return 0;
    else
        return getcount(T->lchild)+1+getcount(T->rchild);

}

void Binary_Tree::display_inorder(struct node *T)
{
    if(T!=NULL)
    {
        display_inorder(T->lchild);
        cout<<T->data<<" ";
        display_inorder(T->rchild);
    }
}

void Binary_Tree::display_preorder(struct node *T)
{
    if(T!=NULL)
    {
        cout<<T->data<<" ";
        display_preorder(T->lchild);
        display_preorder(T->rchild);
    }
}

void Binary_Tree::display_postorder(struct node *T)
{
    if(T!=NULL)
    {
        display_postorder(T->lchild);
        display_postorder(T->rchild);
        cout<<T->data<<" ";
    }
}

