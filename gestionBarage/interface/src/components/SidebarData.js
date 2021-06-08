import React from 'react';
import * as AiIcons from 'react-icons/ai';
import * as IoIcons from 'react-icons/io';
import { ImBooks } from "react-icons/im";
import { BiLogOut } from "react-icons/bi";





export const SidebarData = [{
        title: 'Home',
        path: '/home',
        icon: < AiIcons.AiFillHome / > ,
        cName: 'nav-text'
    },
    {
        title: 'Gestion barrage',
        path: '/gestionBarrage',
        icon: < AiIcons.AiOutlineCalculator / > ,
        cName: 'nav-text'
    },
    

    {
        title: "Panneau administration",
        path: "/admin",
        icon: < IoIcons.IoMdPeople / > ,
        cName: 'nav-text'
    },
    {
        title: 'Fichier',
        path: '/fichier',
        icon: < IoIcons.IoIosPaper / > ,
        cName: 'nav-text'
    },
    {
        title: 'Guide d\'utilisation',
        path: '/guide',
        icon: < ImBooks / > ,
        cName: 'nav-text'
    },
    {
        title: 'Log out',
        path: '/logout',
        icon: < BiLogOut / > ,
        cName: 'nav-text'
    },

];