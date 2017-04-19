#include <linux/module.h>
#include <linux/version.h>
#include <linux/kmod.h>

static int __init hello_drv_init(void)
{
	printk("Calling hello_drv_init\n");
	printk("Hello,I am an hello driver on OpenWrt!\n");
	return 0;
}

static void __exit hello_drv_exit(void)
{
	printk("Calling hello_drv_exit\n");
}

module_init(hello_drv_init);
module_exit(hello_drv_exit);

MODULE_AUTHOR("Humble");
MODULE_LICENSE("GPL");
