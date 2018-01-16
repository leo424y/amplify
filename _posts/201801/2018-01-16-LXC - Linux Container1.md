---
layout: post
comments: true
title: LXC - Linux Container
---



Container會透過filesystem的方式來管理每個Container的可用空間。因此，每個空間原則上實體隔離，不會因為某個Container使用的空間過多而影響另一個空間的使用。而在一些比較高階的Filesystem系統，應該還可以提供每個Filesystem的監控與複製備份能力。





Container主機的運作一般不會將整個OS完全複製，在Linux的系統運作過程中，有許多元件是可以在Container之間共用的，因此一般Container系統，會有幾個Filesystem會抽離到底層的Hypervisor層，達到Thin Provision的能力。





Container的能力通常優於其他虛擬化技術，通常可以逼近直接使用Hypervisor來運算的效能，因此，控管Container之間運作是否互相影響，通常是Container的一個重要課題。

