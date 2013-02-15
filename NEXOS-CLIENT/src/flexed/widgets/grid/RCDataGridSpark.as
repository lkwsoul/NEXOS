/**
 Copyright (c) 2006. Tapper, Nimer and Associates Inc
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 * Neither the name of Tapper, Nimer, and Associates nor the names of its
 contributors may be used to endorse or promote products derived from this
 software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 @ignore
 **/


package flexed.widgets.grid
{
  import flash.display.Sprite;
  
  import mx.collections.ArrayCollection;
  
  import spark.components.DataGrid;
  
  /**
   * This is an extended version of the built-in Flex datagrid. 
   * This extended version has the correct override logic in it
   * to draw the background color of the cells, based on the value of the
   * data in the row.
   **/
  public class RCDataGridSpark extends DataGrid
  {
    private var _rowColorFunction:Function;
    
    public function RCDataGridSpark()
    {
      super();
    }
    
    
    /**
     * A user-defined function that will return the correct color of the
     * row. Usually based on the row data.
     * 
     * expected function signature:
     * public function F(item:Object, defaultColor:uint):uint
     **/
    public function set rowColorFunction(f:Function):void
    {
      this._rowColorFunction = f;
    }
    
    public function get rowColorFunction():Function
    {
      return this._rowColorFunction;
    }
    
    
    
    private var displayWidth:Number; // I wish this was protected, or internal so I didn't have to recalculate it myself.        
    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
    {
      super.updateDisplayList(unscaledWidth, unscaledHeight);            
    }
    
  }
}