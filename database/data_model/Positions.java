/***********************************************************************
 * Module:  Positions.java
 * Author:  linh2
 * Purpose: Defines the Class Positions
 ***********************************************************************/

import java.util.*;

/** @pdOid 6a0b08d5-9c4b-42c5-b20b-924c703ef9d4 */
public class Positions {
   /** @pdOid 14c850ee-b591-44e3-876b-422aa7e13fbd */
   public int positionId;
   /** @pdOid dd1fd1a8-1871-45b5-8d3e-3518cfc98723 */
   public java.lang.String name;
   
   /** @pdRoleInfo migr=no name=Jobs assc=jobPosition mult=0..1 */
   public Jobs jobs;

}