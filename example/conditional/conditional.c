// SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
#include <stdlib.h>



int main()
{
  int a = 5;
  int b = 10;
  if (a < b)
    return(b);
  else if(a == b)
    return(a+b);
  else
    return(a);
}