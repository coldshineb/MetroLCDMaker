import 'package:flutter/material.dart';

import 'Preference.dart';
import 'main.dart';

class Util {
  static const String appVersion = '1.2.2';
  static const String copyright =
      '版权所有 © Calicy LLC 2022-2024 Gennokioku 原忆 2022-2024 Coldshine 2020-2024，由 Flutter 强力驱动';

  //轨道交通标识
  //如后续有修改，需要改 arrivalStationInfoBody.svg 以下内容
  //字体 FZLTHProGlobal-Regular, &apos;FZLTHPro Global&apos; 改为 GennokiokuLCDFont
  static const String railwayTransitLogo = "";

  //已到站 站点信息图主体部分
  //如后续有修改，需要改以下内容
  //1.主体颜色改为 lineColor，保留 #
  //2.字体 FZLTHProGlobal-Regular, &apos;FZLTHPro Global&apos; 改为 GennokiokuLCDFont
  //3.字体颜色 #fff 改为 fontColor，保留 #
  static const String arrivalStationInfoBody = '''
<?xml version="1.0" encoding="UTF-8"?>
<svg id="_图层_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
     viewBox="0 0 1481 307.86">
    <g id="_图层_1-2">
        <rect x="2.5" y="2.5" width="1476" height="302.86" rx="25.71" ry="25.71" fill="none" stroke="#lineColor"
              stroke-miterlimit="10" stroke-width="5"/>
        <path d="M180.67,156.08c-1.81.07-3.94.31-6.27.88-4.68,1.15-8.24,3.16-10.57,4.76-6.07,3.76-13.4,9.25-20.38,17.14-16.01,18.1-20.7,38.09-22.29,48.05v15.3c0,2.93,2.37,5.3,5.3,5.3h54.21c2.93,0,5.3-2.37,5.3-5.3v-80.84c0-2.93-2.37-5.3-5.3-5.3Z"
              fill="#595757" stroke-width="0"/>
        <path d="M1284.03,156.08c1.81.07,3.94.31,6.27.88,4.68,1.15,8.24,3.16,10.57,4.76,6.07,3.76,13.4,9.25,20.38,17.14,16.01,18.1,20.7,38.09,22.29,48.05,0,5.1,0,10.2,0,15.3,0,2.93-2.37,5.3-5.3,5.3h-54.21c-2.93,0-5.3-2.37-5.3-5.3v-80.84c0-2.93,2.37-5.3,5.3-5.3Z"
              fill="#595757" stroke-width="0"/>
        <rect x="145.97" y="30.14" width="80" height="49.1" fill="#lineColor" stroke-width="0"/>
        <text transform="translate(172.21 68.02)" fill="#fontColor" font-family="GennokiokuLCDFont" font-size="40.53">
            <tspan x="0" y="0">A</tspan>
        </text>
        <rect x="145.97" y="83.8" width="80" height="49.1" fill="#lineColor" stroke-width="0"/>
        <text transform="translate(171.4 121.68)" fill="#fontColor" font-family="GennokiokuLCDFont" font-size="40.53">
            <tspan x="0" y="0">D</tspan>
        </text>
        <rect x="1235.49" y="30.14" width="80" height="49.1" fill="#lineColor" stroke-width="0"/>
        <text transform="translate(1262.93 68.02)" fill="#fontColor" font-family="GennokiokuLCDFont" font-size="40.53">
            <tspan x="0" y="0">B</tspan>
        </text>
        <rect x="1235.49" y="83.8" width="80" height="49.1" fill="#lineColor" stroke-width="0"/>
        <text transform="translate(1261.63 121.68)" fill="#fontColor" font-family="GennokiokuLCDFont" font-size="40.53">
            <tspan x="0" y="0">C</tspan>
        </text>
        <rect x="510.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29" fill="none" stroke="#lineColor"
              stroke-miterlimit="10" stroke-width="2"/>
        <path d="M533.22,90.86c-3.3-1.05-6.39,1.45-6.39,4.61,0,1.68.88,3.17,2.2,4.04-1.31.87-2.2,2.36-2.2,4.04v6.8l-2.47,2.47h-2.85c-2.65,0-5.12,1.53-6.16,3.97-2.13,4.98,1.54,9.83,6.28,9.83h7.55l19.83-19.83h1.81c3.06,0,5.86-2.02,6.53-5,.94-4.19-2.27-7.93-6.3-7.93h-7.14l-7.79,7.79c-.38-.87-1-1.61-1.79-2.13,1.71-1.14,2.68-3.32,1.94-5.61-.47-1.43-1.62-2.58-3.06-3.04ZM531.97,93.77c.92,0,1.62.71,1.62,1.62s-.7,1.62-1.62,1.62-1.62-.71-1.62-1.62.71-1.62,1.62-1.62ZM545.77,96.44h5.56c1.47,0,2.81.93,3.23,2.34.72,2.42-1,4.56-3.28,4.56h-3.61l-19.83,19.83h-5.56c-1.47,0-2.81-.93-3.23-2.34-.72-2.42,1-4.56,3.28-4.56h3.61l19.83-19.83ZM533.72,103.39v1s-3.45,3.45-3.45,3.45v-4.43c0-1.24,1.3-2.16,2.59-1.51.55.28.86.88.86,1.49Z"
              fill="#000" stroke-width="0"/>
        <rect x="645.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29" fill="none" stroke="#lineColor"
              stroke-miterlimit="10" stroke-width="2"/>
        <path d="M665.33,85.53l-5.09,5.09h10.18l-5.09-5.09ZM673.81,85.62l5.09,5.09,5.09-5.09h-10.18ZM651.76,95.62v36h41v-36h-41ZM654.76,98.62h34v29h-34v-29ZM666.19,101.2c-2.93-.98-5.71,1.22-5.71,4,0,1.3.62,2.45,1.55,3.23-1.92.99-3.27,2.96-3.27,5.25v5.94h2v7h3v-10h-2v-2.42c0-1.29,1.04-2.58,2.33-2.66,1.48-.1,2.67,1.06,2.67,2.54v2.54h-2v10h4v-7h2v-5.94c0-2.29-1.35-4.25-3.27-5.25,1.18-.99,1.85-2.56,1.42-4.28-.35-1.37-1.39-2.51-2.73-2.96ZM681.19,101.2c-2.93-.98-5.71,1.22-5.71,4,0,1.3.62,2.45,1.55,3.23-1.92.99-3.27,2.96-3.27,5.25v5.94h2v7h3v-10h-2v-2.42c0-1.29,1.04-2.58,2.33-2.66,1.48-.1,2.67,1.06,2.67,2.54v2.54h-1v10h3v-7h2v-5.94c0-2.29-1.35-4.25-3.27-5.25,1.18-.99,1.85-2.56,1.42-4.28-.35-1.37-1.39-2.51-2.73-2.96ZM664.48,104.27c.49,0,.85.36.85.85s-.36.85-.85.85-.85-.36-.85-.85.36-.85.85-.85ZM679.74,104.27c.49,0,.85.36.85.85s-.36.85-.85.85-.85-.36-.85-.85.36-.85.85-.85Z"
              fill="#000" stroke-width="0"/>
        <rect x="447.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29" fill="none" stroke="#lineColor"
              stroke-miterlimit="10" stroke-width="2"/>
        <path d="M481.88,90.62v8.71h-8.71v8.71h-8.71v8.71h-8.71v11.88h3.17v-8.71h8.71v-8.71h8.71v-8.71h8.71v-8.71h8.71v-3.17h-11.88Z"
              fill="#000" stroke-width="0"/>
        <rect x="846.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29"
              transform="translate(1745.52 217.24) rotate(180)" fill="none" stroke="#lineColor" stroke-miterlimit="10"
              stroke-width="2"/>
        <path d="M864.63,90.62v8.71h8.71v8.71h8.71v8.71h8.71v11.88h-3.17v-8.71h-8.71v-8.71h-8.71v-8.71h-8.71v-8.71h-8.71v-3.17h11.88Z"
              fill="#000" stroke-width="0"/>
        <rect x="1053.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29"
              transform="translate(2159.52 217.24) rotate(180)" fill="none" stroke="#lineColor" stroke-miterlimit="10"
              stroke-width="2"/>
        <path d="M1071.63,90.62v8.71h8.71v8.71h8.71v8.71h8.71v11.88h-3.17v-8.71h-8.71v-8.71h-8.71v-8.71h-8.71v-8.71h-8.71v-3.17h11.88Z"
              fill="#000" stroke-width="0"/>
        <rect x="909.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29"
              transform="translate(1871.52 217.24) rotate(-180)" fill="none" stroke="#lineColor" stroke-miterlimit="10"
              stroke-width="2"/>
        <image width="512" height="512" transform="translate(960.62 86.76) rotate(-180) scale(.1 -.1)"
               xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAACXBIWXMAAAsTAAALEwEAmpwYAAAd1ElEQVR4nO3dCdB2Z1kf8H8gCyEQtrAOA4GAJggt2VqksQitIlgmMkAIahE7LVAWZSittSIBFxbBgRQwDR02pSzWZVqKwAglFJGwN6xagYoQICELSyALIW/nwPmaz/gt7/K8z3Wdc36/mWsmIxjec+77Pv/7Ps99zkkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYN5uluSkJI9J8pwkb0zy50kuSPLZJJcluXqsy8b/2/CfvXf87z47yZnjv+Oo6oNhFv1x6E/nJnl/kouTXJNkQ+34HFwxjuEvJfl4kncleVOSFyZ5cpKHJLlrdQcAds8Q0g9O8oIkH0xy7QovrMO/6wNJnp/kx5PcVEOySfdI8ook3xL05ZOdy5O8O8lvJTk9yW31YpiuIYh/Nsnbx5X8ui4kw//W25L8jMkA+3HkOBm1yu9b1yX5aJLnJfnHSW6sN0N/pyV5VZKvN7iIDH/DK8e/CQbHjT8nVfdNtbVzcFGS30nygCQ30pWhj0OSPHT8jb7rhe294++NLNeJSb7SoC+qnZ2DYU/QLye5Q3WHgqUH/8OTfHhCF7UPJfmp6hPH2g0bRi9t0P/U6s7B8BPO7yW5r/EE63VCkv854QvaO5Mcr9MsgvCffw17je5f3dFgCZv7nrvmjX27VcMx/KbNgrMm/JdVbxl/6gFW7H5JPtdgkK+6hmP6h3rL7Aj/ZdZ3x82/9gjAin7r/zczf2xqOLanj8fK9An/+jHV4SmgX/TUAGzfLZL81waDeV3135PcWoeZtGFT2CUN+pLqcQ4+4mcB2Lpjk/xlgwFc8ZjR8JY4pkf414+fjnXVeDcA2IQfSvLFBgO3qr7s8aLJEf7146Z7/XGSW1V3VOi+2c8t1O+/n/xHqhuDTRH+9eE6lfprm35h34b3bn+7wSDtUsO5MAnozYa/+nEyxZ8EnljdcaGT+4yf7qwenB13E3vbWE9W/vXjY8p1tid/ILnb+M3u6gHZtS4cN0XSh/CvHxdzqNcmOay6M0OV4bG3v2owELvXXyS5pW7agtv+9eNhTvXfxs9Ew6IcMj77Xj0Ap7SL2MuCagn/+nEwx3qPCT5L84wGA29q9bTqRlswt/3r+/+c6/wkR1V3cliHfzCTj/pUvDb4h3XRtRP+9X1/CfXmJIca38z9q35z/LDPuuozfjNcK7f96/v8kuqVfupjzp7bYJBNvX6tuhEXwsq/vq8vsZ5b3fFhN5zg1v/KXibyA7rorrLyrw/CJdcTjG/m5p0NBtZc6k+rG3PGrPzr+/fS66pxEgqz8PAGg2pu9bDqRp0hK//6fq3yvXMwvCPl6OoBAavwQQN75Re2D9swtFJW/sK32+Tj91fbxWH9frLBQJprPViHXgnhX9+XVfZ5Dp5kjDNl7zW4d/UtYuyM2/7Ct/Pk48okxxvkTNFpDQbQ3Ov+1Y08YcK/vv+qHPQcDBuoYXJeZYDv+gXuFdWNPFFu+wvfKU0+frp6wMBWDF+5+lqDgTP3+vr4hkU2T/jX91u1tXPwFR8NYkp+pvkgv3h89eZjx1vBx4zv4j50/OeTx/9suIvx1QZ/74HqzOrGnpAp3vYf/l7PhW/OYUluleRuSU5M8ugkv5rkDUkubNCWGzuo/7jLYwNW5u0NBsy+6tNJHrXFD28MF5VHJPlAg79/X/UW/XZThD/DWzSfmOTdSa5rMHY3tlDXJvn7mpDujmr4xb9hxf8vd/jFrUOS/POGK8grx59c2D/hzw3dNcmzklzUYAxvbOGrgdDagxsMlL1reBTxTis8vuOSfLLBce1d/3SFxzc3wp8DGfbQ/EKSLzQYxxubqPtpTjp7QYNBsqf+ZJdWx0c3+5nDV8T2TfizlTuXz29493LjBvVWTUpnXV79+2e7fGt8WDm8r8FxDvX+XTzOqRL+bPfLpV2uYRv7qGHvwt/TtHR0s3GzSoff/Fd5239/7pzkkgbHO5xzjwNeT/izE4cneUnjjYKv1bx0vfBuNKhhw9+6PLbB8W6Mz7cj/FmdM8bP8240q6uT3F5D081jmjzqt5Pd/tt5OuBDDY57eOZ56az8WbUHjS/c2mhWv6Sp6eY5DQbG8Jz/uj2ywXGflWUT/uyWUxpOAv7KJ8Hp5o0NfvsfXtyzboc1eGPg67Ncwp913Ano9nPAaZqdTqo//zu83rfKq4uPfamfBxb+rMujm20MfKmmp5OPFQ+IYUNelccVH/sFWR7hz7qd3SD4N8b6cpIb6wJ08X+LB8RJxb8TVh7757Iswp+qRwQ7vSfgH+kGdFH9TPxtCo/9mOJjH/YgLIXwp9K9klzTIPw3kvyGrkAX1a/RrNgAuPfKoPLYhw1KS3DfBhPNrdblSU6tPnGs1G816FcbST6sXemiegIwhPBSJwDDuZ87K386vfX0wgYTgOuS3Lr6ZEAafCp3yT8BDKviORP+dPO0BhOAjSQPqz4RMPj8gjcBnlp87MMGzLly25+Objq+e2SjuIavGEK5TxQPhJ8rPPafLz72j2eerPzp7KwGE4B3VZ8EWPqLgF5TfOxzfBGQ8Ke7Yxu8HOjS6pMAg99b8KuAq3emz+0ToW77MxXvKR77G+OnyaHUsxoMhEcUHPejGhz3MzMfVv5MyZMajP8HV58EOLPBQPjAmr+Sdcj4LG71cQ/fLp8D4c/U/GCD8f/E6pMAJzcYCEP97II2/+2p4Zb51Lntz1RdWDz+X1B9AuCIJFc2CMNhU8xxa2iOeya5rMHxfjv53rmfMit/puyNxdeA4X8fyp3XIBCH+nSSW+zicd68wWOPe+qdmTYrf6bu2a4BUD8Q9q63jy/rWLWjk/xpg+PbU8Pmy6my8mcOHlN8Dfjf1ScABg9sEIh71/tW/IjMcNv/Uw2Oa+96wES7nvBnLk4uvgZ8ofoEwOAmSb7RIBT3rkvGtwTu5OmAQ8YNfx1+89+7vjbR3/+FP3N7IdBGYQ3XJWjhtQ2CcV/1oSSP3OLLgg4fn/P/SIO/f181vIFwaoQ/c3Ob4uvAt6pPAOzxEw2C8WB3BF6d5HFJTkly23FScPj4z6eMq/3XNHjD39xeACL8maMjiq8D36k+AbDHoUm+0iAc514Xj+d6Kuz2Z66OKL4WXFV9AmBvL24QkHOv4RxPhZU/c3ab4mvBRdUnAG64KeY7DUJyrnVtkrtPpMtZ+TN3d2vwtBO0Uv12rDnXGzINVv4swSnF14Nzqk8AdHs2ds41BGt3wp+leEzx9WAuHwNjZt7WICznVn+S/oQ/S3JW4fXgiiQ3qz4BsC/3thdgpYN92FfxQ827mvBnad5UOAE4t/rg4UB+p8GqeS71suZdTfizRF8quh5cvaYvn8K2HZPk8gbhOfW6bDyXXQl/luj4wmvC86oPHjbj8Q0CdOr1rxp3NeHPUj256Hrw0fHbK9De8DGdNzcI0anWcO66Ev4s2XsKrgdfntB7QOB77jC+vrY6TKdWwzm7fdM+JPxZ+guAriu4Jvyz6gOH7fipogEz1RrO1elNu5rwZ+meXXBNuCbJUdUHDtv16w2CdSr1nKbdzOt9Wbqjiu5ovrf6wGGn+wG8JvjgA/2PktyoYVcT/pA8vWhR8FwnnznMnj/SYIXdtT7S9Daf2/6Q3Lzw2f+f0ABMnQnAwR/x6TYBEP7wfb9dFP7XjJMPmKzhtvYfNlhld68/bvQTgPCH619vfk3RNeHtGoGp+40G4TqV6vCmL+EP33dEkg8XXg8eryGYsod7DHDLjwFW/uYn/OF6Ly0M/2sbvw8ENvUioK82WFVPrb6S5HYF/Uv4w/V+uvg6cJ7GYMqP/r2lQZhOtf7HmttL+MP1/sn45b3Ka8BTNQhT9YQGITr1evSa2kr4w/VOSfKN4rF/VZLbahSmaOi4Pge8mg+A3GKX28pLfuB6D0zy9QaT/9dpFKbqnAYDaC41PH+8W6z84W//5l99239jrB/RMEzRvZJ8p8EAmksNF6Rjd6GdrPzh+kf9zm70tNKnxj1UMDlvbzCA5lbnrriNrPzh+pf8VD7nv7GPeorGYaqbZ6oHzxzrmvE75Ksg/OH7r9f97cI3/G3sp4bHpm+mgZiiNzUYQHOt4RblTgl/lu6o8at+VR/22ThI/fvqEwTbcbfxzVXVA2iu9bUdfixI+LP069Ozm7+Y7BIf/mGqXtJgAM29tvtecOHPEp0w/p7+nkYb/DYOUP+h+oTBdhya5OIGA2ju9cFttI3wZ64OT3LrJHdPcnKSxyQ5a/wpsust/o0DrP6Prj6hsB0PaTCADlTDbb9XJXnsGIjHjJOWQ8d/Hi4ePzf+dy5p8PceqLayGVD408Gwqe3M8WmW94+LhW6b76rrSdWNBNv1uw0G0P5WzI9MctgWjuWw8f/nQw3+/n3Vv93kcQh/qt0jySuSfKvBuOlcH0ly4+rGgu04ssF7s29Yl42r/Z28TOOQ8a7AZQ2OZ+86fxN/u/Cn+prwAqv8bGY8D3sT7q+7MlUPahCKN3yL1j1XeHzDv+vTDY5rT303ya0O8PcKfyodl+SCBuNkKvVq3ZUpe06DQbSn3rFLH8+5xfjv3mhSD9vP3yn8qXRikq80GB9Tqa8muZ0uy5Sd12Ag7Vn57+aX84Zn8D/Q4Dj394Eg4U+lKfa/6jpdl2XKbpLkygYD6dIV3/bfn7s0uci9bwYX30vHv5vpm2L/q65XVDca7NTJDQbSxrjhb11+vsHxfnOvDY6+6kelKfa/6vqMN/4xB2c2edRvnZ/OPKTJ18PuOtGVl5X/fEyx/3X4vPep1Q0Hq/CsBgNqeGZ/3R7V4LifOcGLr/CfD+GfbY2Bf1HdcLAqr2sQKMPrQNdteFmQ255ba6vLrXxmw23/bOt69cLqhoNV+vPiCcDw6t4qryk+9imVlf98WPlvbwy82dv+mJtPFAfL8Ka+Kh02A06hhP98CP/tjYELbPpjjj5fHC6Vj5Gd2iBcu5fb/vPhtv/2xsBfJrljdePBbqjehHabwmY9pkHAdi4r//mw8t/eGPg/Se5U3XiwW64uDpmtfOVv1Q5vELJdy8p/Pqz8tzcG/np8VBdmqzpoln78HcvKfz6s/Ld/2/8u1Y0Hu606bJZ+/N3Kyn8+rPy3Nwbem+S21Y0H61AdOEs//k4l/OdD+G9vDLxx/D4KLEJ16Cz9+LuU2/7z4bb/1vv/dUl+pbrhYN2qg2fpx9+hrPznw8p/6/3/oiQ/Wd1wUKE6fJZ+/NUl/OdD+G+9/78tyR2qGw6qVAfQ0o9f+LMKwn9rY+nKJL+45q+QQjvVIbT0468qK//5EP5bf6f/3asbDTqoDqKlH7/wZyeE/+bH0F8keYjuBterDqOlH/+6y27/+bDbf3N9/itJfiHJodUNBt1UB9LSj3+d5bb/fFj5H7y/f278nf/I6saCrqpDaenHv66y8p8PK/8D9/UPJjkjyY2rGwq6qw6mpR//OsrKfz6s/Pfdx/8mydnFnxeHyakOp6Uf/26Xlf98WPn/7b79qTH0f9jjfLA91QG19OMX/mzG0sP/2iSfTPLy8fb+7XUb2Lnqgb3049+tsvKfjzmH/zVJLhs37H08yfnj2/nOTfKMJKcnOSHJEdWNAHNUfQFY+vHvRvnNfz6m+Ju//gcTUX2xWPrxu/iyP8If2FXVgbX0419lWXnNh/AHdl11aC39+IU/NyT8gbWoDq6lH/8qysp/PoQ/sDbV4bX04xf+7CH8gbWqDrClH/9Oysp/PoQ/sHbVIbb04xf+CH+gRHWQLf34t1NW/vMh/IEy1WFW/Ya1jYmVN/zNxxTf8Kf/wYxUX1CqWHlRSf8Dyi1xAuDiSyX9D2hhaRMAF18q6X9AG0uaALj4Ukn/A1pZygTAxZdK+h/QzhImAC6+VNL/gJbmPgFw8aWS/ge0NecJgIsvlfQ/oLW5TgBcfKmk/wHtzXEC4OJLJf0PmIS5TQBcfKmk/wGTMacJgIsvlfQ/YFLmMgFw8aWS/gdMzhwmAC6+VNL/gEma+gTAxZdK+h8wWVOeALj4Ukn/AyZtqhMAF18q6X/A5E1xAuDiSyX9D5iFqU0AXHyppP8BszGlCYCLL5X0P2BWpjIBcPGlkv4HzM4UJgAuvlTS/4BZ6j4BcPGlkv4HzFbnCYCLL5X0P2DWuk4AXHyppP8Bs9dxAuDiSyX9D1iEbhMAF18q6X/AYnSaALj4Ukn/AxalywTAxZdK+h+wOB0mAC6+VNL/gEWqngC4+FJJ/wMWq3oCcGmDv2Grf+9J1Y3GSgztqP8Bi1UdqFOqy5OcWt1grISVP7B41aE6lRL+8yH8ARoE6xRK+M+H8AcYVYdr9xL+8yH8AfZSHbCdS/jPh/AHuIHqkO1awn8+hD/APlQHbccS/vMh/AH2ozpsu5Xwnw/hD3AA1YHbqYT/fAh/gIOoDt0uJfznQ/gDbEJ18HYo4T8fwh9gkzYWXsJ/PoQ/wBZUB7DwZxWEP8AWVYewlT87JfwBtqE6iN32ZyeEP8A2bSys/OY/H8IfYAeqA1n4sx3CH2CHqkPZyp+tEv4AK1AdzG77sxXCH2BFNmZefvOfD+EPsELVAS382QzhD7Bi1SFt5c/BCH+AXVAd1G77cyDCH2CXbMys/OY/H8IfYBdVB7bwZ1+EP8Auqw5tK39uSPgDrEF1cLvtz96EP8CabEy8/OY/H8IfYI2qA1z4MxD+AGtWHeJW/gh/gALVQe62/7IJf4ACJzUI863WpePfzfSdNLZndZ/S/4BFsfJC/9ta+NtwCkye8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyyM8Ef/E/7Awgh/9D/hDyzMSUku3eLFr7ouHf9upk//Ayhg5U8l/Q+ggIsvlfQ/gAIuvlTS/wAKuPhSSf8D2KRjkzw0yZOTvCjJm5Kcl+TjSb6U5LIkVzTYmGfDHwdjwx/AftwuyelJXpjk3UkubxDAwp9VEP4Ae7lxkgckeX6SCxoEbqfyqN98CH+AJDdK8sAk5yS5uEHQdizhPx/CH1i8OyT5pSSfbRCwnWv42ePUxfeWebDhD1i0E5O8Lsk1DcK1e1n5z4eVP7BYpyV5R4NQnUoJ//kQ/sAinZzkrQ0CdUol/OdD+AOLc8ck5ya5tkGgTqn85j8ffvMHFvco39OTfLNBmE6trPznw8ofWJR7Jzm/QZBOsaz858PKH1iUxye5qkGQTrGE/3wIf2Axjk7yxgYhOtUS/vMh/IFF/c75mQYhOtUS/vMh/IHFGL7Gd3WDEJ1q2fA3Hzb8AYtwSJJnNwjQKZeV/3xY+QOLecTvPzcI0CmX8J8P4Q8swhFJ/rBBgE65hP98CH9gEW6Z5M8aBOiUy2/+8+E3f2ARjkzyngYBOuWy8p8PK39gMb/5/1GDAJ1yCf/5EP7AYnb7v7JBgE65hP98CH9gMV7YIECnXMJ/PoQ/sKiX/FQH6JTLhr/5sOEPWIxTfNTHyp/vsfIHFvW432cbrKCnWm77z4fwBxblDxqE6FRL+M+H8AcW5akNQnSq9eUxNJg+v/kDi3Ifv/tvO/w/muTu1Q3ISgh/YHEv+3l/g1X01Gr4FPLzktykugFZCeEPLM7TG4TplOqKJOcmOa664VgZ4Q8szh2TfKNBqHZe5V+U5Pwk5yQ5I8lR1Y3GSgl/YJFe3SBkd1JfTPL6JM8cw/nEJHdLcqskh1WfXNoT/sAinZzkuw1CfCs1/L3nJXlCkntWn0AmTfgDi/XWBoG+2Rpuw/9qkrtUnzRmQfgDi3Vag1DfTP1NkqckObL6hDEbwh9YtHc0CPeDbb57bpKbVp8oZkX4A4t2YoOAP1ANO+5/sPokMTvCH1i8/9Ig5PdV1yU5O8nhi28hVs27/YHFG577v6ZB2N+wrkzyiMW3DrvByh8gya80CPsb1jeT/JjWYRdY+QMkuVGSzzUI/L3ra+P7CGDVrPwBRg9seNv/R7UOu0D4A+zlnAahv/eGP7/5sxuEP8BeDh3fprfRpF6kddgFfvMHuIEHNAj9vZ/z96EeVs3KH2Afnt8g+Pe84e94LcSKWfkD7MfHGoT/UL+phVgx4Q+wH7cbN911+LCPd/uzSm77AxzAwxuE/8b4VT9YFSt/gIN4UYPwH55A8ElfVkX4A2zCuxtMAH5VS7EibvsDbMIhSS4vDv9h/8GxWosVsPIH2KRjG6z+36W1WAHhD7AFD20wAXiCFmOH3PYH2KKnNJgA3EOrsQNW/gATfALgQq3GDgh/gG36/eIJwOu1HNvktj/ADpxXPAHw+B/bYeUPsEOfKJ4AnKEF2SLhD7ACFxZPAE7UimyB2/4AK/K14gnAXbQkm2TlD7BC3y6eANxaa7IJwh9gxa4tngAcrkU5COEPsAuuNgGgMeEPsEsuKr4DcBsty37Y8Aewi95nEyANWfkD7LKXF08AhlUe7M3KH2ANHlE8AXi0VmYvwh9gTY4sfheAVwGzh9v+AGv20sIJwBu0Nlb+ADXumuTKognAFzX64rntD1DorMK7AD+g5RdL+AMUOyzJ+UUTgH9dffCUEP4ATdw5yecLJgDvrj5w1k74AzRzWsEE4LpxHwLLIPwBGjo0ydcLJgHPqj5w1kL4AzT21oIJwCVJjqo+cHaV5/wBmvvlggnAUE+tPnB2jfAHmID7F00AvuAuwCy57Q8wEYcnuaJoEvD86oNnpYQ/wMT8QdEE4OokJ1QfPCsh/AEm6DFFE4ChPjjehWC6/OYPMFE3L/w+wFAvrj4BbJvwB5i4NxdOAIaXA51RfQLYMrf9AWbgcYUTgKGuSvKg6pPApgl/gJk4Osk3iicBw1sJT6k+ERyU8AeYmf9UPAEY6ptJfrz6RLBffvMHmKETG0wA9vwc8Ojqk8HfYeUPMGPnN5gA7KlzkxxRfUL4Hit/gJmr3gy4r/cE3Kv6pCyclT/AAhwxvqd/o1F9J8nZ40ZF1svKH2BBntIg9PdVFyZ5mo8IrY2VP8DC3CTJFxsE/v7q4iRnJTm2+kTNmPAHWKinNgj6zbxB8H8leVKS46tP2IwIf4CF3wW4sEHIb6W+lORN492BM5OcnOTuSW7tg0ObJvwByGMbhLpyDg7UBy5PcqqxCrBahyQ5TwCZhDTtA8IfYBfde3wMr/pir5wD4Q+wZi8TPiYgjfqAlT/AmtxqghsC1TzPwaXjRkUA1uTHxsfuqgNALfccWPkDFHlxgxBQyzwHwh+g+DsBFzQIA7WscyD8ARq4T5JvNwgFtYxz4Dd/gEYeaT9AeTAuoaz8ARr6tQYBoeZ7DoQ/QOO3BL6hQVCo+Z0D4Q/Q3E2TfKhBYKj5nAO/+QNMxDFJPtYgONT0z4GVP8DE3DbJxxsEiJruORD+ABN1uySfbBAkanrnQPgDTNydknyiQaCo6ZwDv/kDzMTNk7ylQbCo/ufAyh9gZg5N8vIGAaP6ngPhDzBj/y7JdxuEjep1Dtz2B1iAByX5QoPQUT3OgZU/wILc0lsDy4O3Qwl/gIV6bJJvNggiJfwBWLM7J/ldIbyoSYiVPwD/348muaBBOCnhD0DB44JPTfJlQTzLiYjd/gAc0OHj/oBPNwgttZpz4LY/AJt2oySPTPJ+QTzpichwR+e++j0A23FCkl9P8tkGgaY2fw4+muTuujwAq3C/JC8ZvzZ4nUBuOSG5OsnzktxElwdgtz47/KgkLxu/PHhtg/Bbcl2R5Nwkx+nuAKx7A+HxSU5P8owxjN6W5PwkH0/yuSSXJbmmQVjOYZV/0Xhuz0lyRpKjdHcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEgb/w9oDGC87ib+RQAAAABJRU5ErkJggg=="/>
        <rect x="242.76" y="82.62" width="52" height="52" rx="4.29" ry="4.29" fill="none" stroke="#lineColor"
              stroke-miterlimit="10" stroke-width="2"/>
        <path d="M259.48,90.62c-2.54,0-4.63,2.09-4.63,4.63s2.09,4.63,4.63,4.63,4.63-2.09,4.63-4.63-2.09-4.63-4.63-4.63ZM259.44,99.83h-3.04c-2.55,0-4.63,2.09-4.63,4.63v8.75l3.07,3.09v11.17h3.07v-12.54l-3.07-3.07v-7.42c0-.85.69-1.54,1.54-1.54h6.12c.85,0,1.54.69,1.54,1.54v7.42l-3.07,3.07v12.54h3.07v-11.27l3.07-3.07v-8.67c0-2.55-2.09-4.63-4.63-4.63h-3.04ZM278.02,90.62c-2.54,0-4.63,2.09-4.63,4.63s2.09,4.63,4.63,4.63c1.87,0,3.36-.99,4.53-1.85,1.16-.86,1.99-1.71,1.99-1.71l1.04-1.08-1.05-1.07s-.83-.85-2-1.71c-1.16-.86-2.65-1.85-4.51-1.85ZM277.86,99.83h-2.32l-.46.63c-2,2.74-3.12,6.69-3.86,10.03-.74,3.34-1.04,6.06-1.04,6.06l-.18,1.7h3.25v9.21h3.07v-9.21h3.07v9.21h3.07v-9.21h3.29l-.23-1.74s-.36-2.72-1.13-6.05c-.77-3.32-1.89-7.24-3.73-9.96l-.46-.68h-2.35ZM259.48,93.71c.87,0,1.54.67,1.54,1.54s-.67,1.54-1.54,1.54-1.54-.67-1.54-1.54.67-1.54,1.54-1.54ZM278.02,93.71c.53,0,1.75.55,2.69,1.24.21.15.18.16.36.31-.17.14-.14.15-.34.3-.94.69-2.15,1.24-2.7,1.24-.87,0-1.54-.68-1.54-1.54s.68-1.54,1.54-1.54ZM277.48,102.9h1.04c1.23,2.09,2.36,5.34,3.04,8.27.51,2.21.6,3.06.75,4.02h-8.62c.13-.95.2-1.82.69-4.04.65-2.93,1.79-6.18,3.1-8.25Z"
              fill="#000" stroke-width="0"/>
    </g>
</svg>
  ''';

  static const String arrivalStationInfoTransfer =
      '''<?xml version="1.0" encoding="UTF-8"?>
<svg id="_图层_2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 504.5 307.86">
    <g id="_图层_1-2">
        <g id="transfer">
            <rect x="2.5" y="2.5" width="499.5" height="302.86" rx="25.71" ry="25.71" fill="none" stroke="#lineColor"
                  stroke-miterlimit="10" stroke-width="5"/>
            <text transform="translate(74.19 156.08)" fill="#000"
                  font-family="GennokiokuLCDFont">
                <tspan font-size="55.08">
                    <tspan x="0" y="0">换乘</tspan>
                </tspan>
                <tspan font-size="28.16">
                    <tspan x="-11.71" y="33.8" letter-spacing="-.07em">T</tspan>
                    <tspan x="1.69" y="33.8" letter-spacing="-.02em">r</tspan>
                    <tspan x="11.21" y="33.8">an</tspan>
                    <tspan x="42.56" y="33.8" letter-spacing="-.01em">s</tspan>
                    <tspan x="55.82" y="33.8" letter-spacing="-.02em">f</tspan>
                    <tspan x="64.27" y="33.8">er</tspan>
                    <tspan x="95.53" y="33.8" letter-spacing="-.01em">t</tspan>
                    <tspan x="105.79" y="33.8">o</tspan>
                </tspan>
            </text>
        </g>
    </g>
</svg>
''';

  static const String screenDoorCoverDirectionArrow =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="631.25" height="578.125">
   <g>
      <path
         d="M475.625 323.635H-45.078L215.078 583.79h-81.64l-289.063-289.063L133.438 5.666h81.64L-45.078 265.822h520.703v57.813z"
         transform="translate(155.625 -5.666)" />
   </g>
</svg>
  ''';

  //浅色主题
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: "GennokiokuLCDFont",
      colorScheme: lightColorScheme(),
    );
  }

  //深色主题
  static ThemeData darkThemeData() {
    return ThemeData(
      fontFamily: "GennokiokuLCDFont",
      colorScheme: darkColorScheme(),
    );
  }

  static ColorScheme lightColorScheme() {
    return ColorScheme.fromSeed(
      seedColor: Colors.pink,
    );
  }

  static ColorScheme darkColorScheme() {
    return ColorScheme.fromSeed(
        seedColor: Colors.pink, brightness: Brightness.dark);
  }

  //LCD默认中粗体
  static FontWeight lcdBoldFont = HomeState.sharedPreferences?.getBool(
            PreferenceKey.lcdIsBoldFont,
          ) ??
          true
      ? FontWeight.w600
      : FontWeight.normal;

  static FontWeight screenDoorCoverBoldFont =
      HomeState.sharedPreferences?.getBool(
                PreferenceKey.screenDoorCoverIsBoldFont,
              ) ??
              true
          ? FontWeight.w600
          : FontWeight.normal;

  //LCD默认最大站点数
  static int lcdMaxStation = HomeState.sharedPreferences?.getInt(
        PreferenceKey.lcdMaxStation,
      ) ??
      32;

  //屏蔽门盖板默认最大站点数
  static int screenDoorCoverMaxStation = HomeState.sharedPreferences?.getInt(
        PreferenceKey.screenDoorCoverMaxStation,
      ) ??
      36;

  static Color hexToColor(String hexColor) {
    return Color(int.parse('FF${hexColor.replaceAll('#', '')}', radix: 16));
  }

  static Color getTextColorForBackground(Color backgroundColor) {
    // 根据亮度值返回合适的文本颜色
    return backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  // 获取文本宽度
  static double getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }
}
