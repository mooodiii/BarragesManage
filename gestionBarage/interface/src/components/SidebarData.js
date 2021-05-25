import React from 'react';
import * as AiIcons from 'react-icons/ai';
import * as IoIcons from 'react-icons/io';




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
        title: 'Log out',
        path: '/logout',
        icon: < AiIcons.AiFillHome / > ,
        cName: 'nav-text'
    },

];